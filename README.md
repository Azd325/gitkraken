# Gitkraken AUR Package

[![AUR version](https://img.shields.io/aur/version/gitkraken?label=AUR)](https://aur.archlinux.org/packages/gitkraken)
[![Upstream version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.gitkraken.dev%2Freleases%2Fproduction%2Flinux%2Fx64%2FRELEASES&query=%24.name&label=upstream&color=blue)](https://help.gitkraken.com/gitkraken-desktop/current/)
[![AUR votes](https://img.shields.io/aur/votes/gitkraken)](https://aur.archlinux.org/packages/gitkraken)
[![Linting](https://img.shields.io/github/actions/workflow/status/Azd325/gitkraken/validate-package.yml?branch=master&event=push&label=Linting)](https://github.com/Azd325/gitkraken/actions/workflows/validate-package.yml?query=branch%3Amaster)

## Gitkraken

This package provides only a way to install Gitkraken on Arch Linux.

You can receive help with Gitkraken, through the [Help Center](https://help.gitkraken.com/).

You can also submit [feature requests](https://feedback.gitkraken.com/) and see upcoming features on the [roadmap](https://www.gitkraken.com/git-client/roadmap).

## License

The packaging files in this repository are licensed under [0BSD](LICENSE). GitKraken itself is under its EULA ([eula.html](gitkraken-aur/eula.html)).

## Contributing

### Update package

- Change to the [gitkraken-aur](gitkraken-aur) folder
- Update package version in [PKGBUILD](gitkraken-aur/PKGBUILD)
- Update checksums with `updpkgsums` (this only refreshes the build host's
  architecture; `updpkgsums` leaves `sha256sums_aarch64` untouched on an
  `x86_64` host — `./update.sh` hashes the aarch64 tarball directly to cover it)
- Do a test installation with `makepkg --syncdeps --install` [Docs for makepkg](https://wiki.archlinux.org/title/makepkg)
- Update [.SRCINFO](gitkraken-aur/.SRCINFO) with `makepkg --printsrcinfo > .SRCINFO` [Docs for makepkg](https://wiki.archlinux.org/title/makepkg)
