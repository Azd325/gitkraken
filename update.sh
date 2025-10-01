#!/bin/bash
set -euo pipefail

RELEASES_URL="https://api.gitkraken.dev/releases/production/linux/x64/RELEASES"

force_run=false
bump_pkgrel=false

usage() {
	cat <<'USAGE'
Usage: ./update.sh [options]

Options:
  -f, --force         Run even if pkgver matches upstream (no pkgrel bump).
  -p, --bump-pkgrel   Increment pkgrel when pkgver matches upstream.
  -h, --help          Show this help text.
USAGE
}

while [[ $# -gt 0 ]]; do
	case "$1" in
	-f | --force)
		force_run=true
		;;
	-p | --bump-pkgrel)
		bump_pkgrel=true
		;;
	-h | --help)
		usage
		exit 0
		;;
	*)
		echo "Unknown option: $1" >&2
		usage >&2
		exit 1
		;;
	esac
	shift
done

echo "Fetching latest GitKraken release metadata..."
release_data=$(curl -fsSL "$RELEASES_URL") || {
	echo "Failed to download release metadata" >&2
	exit 1
}

if command -v jq >/dev/null 2>&1; then
	latest_version=$(printf '%s' "$release_data" | jq -r '.name')
else
	latest_version=$(printf '%s' "$release_data" | sed -n 's/.*"name":"\([^"]*\)".*/\1/p' | head -n1)
fi

if [[ -z "${latest_version:-}" || "${latest_version}" == "null" ]]; then
	echo "Unable to determine the latest GitKraken version" >&2
	exit 1
fi

echo "Latest upstream version: ${latest_version}"

pushd gitkraken-aur >/dev/null
trap 'popd >/dev/null' EXIT

update_field() {
	local key="$1"
	local value="$2"
	tmp=$(mktemp)
	awk -v key="$key" -v value="$value" '{ if ($0 ~ "^" key "=") { print key "=" value } else { print } }' PKGBUILD >"$tmp"
	mv "$tmp" PKGBUILD
}

current_version=$(grep '^pkgver=' PKGBUILD | cut -d= -f2)
current_pkgrel=$(grep '^pkgrel=' PKGBUILD | cut -d= -f2)

if [[ "$current_version" == "$latest_version" ]]; then
	if [[ "$bump_pkgrel" == true ]]; then
		if [[ "$current_pkgrel" =~ ^[0-9]+$ ]]; then
			new_pkgrel=$((current_pkgrel + 1))
			echo "Incrementing pkgrel from ${current_pkgrel} to ${new_pkgrel}"
			update_field pkgrel "$new_pkgrel"
		else
			echo "Current pkgrel (${current_pkgrel}) is not numeric; aborting." >&2
			exit 1
		fi
	elif [[ "$force_run" == true ]]; then
		echo "Pkgver matches upstream; continuing due to --force."
	else
		printf 'GitKraken %s is already packaged.\n\n' "$current_version"
		exit 0
	fi
else
	echo "Updating PKGBUILD from ${current_version} to ${latest_version}"
	update_field pkgver "$latest_version"
	update_field pkgrel 1
	export PREVIOUS_VERSION="$current_version"
fi

echo "Refreshing checksums"
updpkgsums

echo "Removing previous build artifacts"
rm -rf pkg/ src/ ./*.pkg.tar.zst ./*.tar.gz

echo "Building package to validate sources"
makepkg --syncdeps --cleanbuild --noconfirm

echo "Regenerating .SRCINFO"
makepkg --printsrcinfo >.SRCINFO

if [[ -n "${GITHUB_ENV:-}" ]]; then
	printf 'NEW_VERSION=%s\n' "$latest_version" >>"$GITHUB_ENV"
	printf 'PREVIOUS_VERSION=%s\n' "${PREVIOUS_VERSION:-$current_version}" >>"$GITHUB_ENV"
fi

echo "Cleaning up build artifacts"
rm -rf pkg/ src/ ./*.pkg.tar.zst ./*.tar.gz

final_pkgver=$(grep '^pkgver=' PKGBUILD | cut -d= -f2)
final_pkgrel=$(grep '^pkgrel=' PKGBUILD | cut -d= -f2)

printf 'PKGBUILD now at %s-%s. Review changes and commit manually.\n' "$final_pkgver" "$final_pkgrel"

trap - EXIT
popd >/dev/null

printf '\nAll done!\n'
