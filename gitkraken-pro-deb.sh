#!/usr/bin/env bash
set -e

# Maintainer: KillWolfVlad <github.com/KillWolfVlad>
# License: GNU GPL v3

_workdir=$(pwd)
_scriptdir=$(dirname "$(readlink -f "$0")")

source "${_scriptdir}/PKGBUILD"

srcdir="${_workdir}/src-deb"
_pkgdir="${_workdir}/pkg-deb"

mkdir -p "${srcdir}" "${_pkgdir}"

for i in "${source[@]}"; do
  ln -sf "${_scriptdir}/$i" "${srcdir}"
done

cd "${srcdir}"
build

for name in "${pkgname[@]}"; do
  _workdir="${_workdir}" _scriptdir="${_scriptdir}" \
  _pkgdir="${_pkgdir}" srcdir="${srcdir}" name="${name}" \
  fakeroot bash -c \
  '
  set -e

  umask 022

  _PKGEXT="tar"

  source "${_scriptdir}/PKGBUILD"

  _control="Package: ${name}
Version: ${pkgver}
Depends: gconf2, gconf-service, libgtk2.0-0, libudev0 | libudev1, libgcrypt11 | libgcrypt20, libnotify4, libxtst6, libnss3, python, gvfs-bin, xdg-utils
Conflicts: gitkraken, gitkraken-pro, gitkraken-enterprise
Suggests: libgnome-keyring0, gir1.2-gnomekeyring-1.0
Section: misc
Priority: optional
Architecture: amd64
Installed-Size: 239816
Maintainer: KillWolfVlad <github.com/KillWolfVlad>
Description: Unleash your repo"

  debdir="${_pkgdir}/${name}-${pkgver}"
  pkgdir="${debdir}/data"
  controldir="${debdir}/control"

  cd "${srcdir}"
  mkdir -p "${pkgdir}" "${controldir}"
  echo "${_control}" > "${controldir}/control"
  echo "2.0" > "${debdir}/debian-binary"
  package_${name}

  cd "${pkgdir}"
  bsdtar -acf "../data.${_PKGEXT}" *

  cd "${controldir}"
  bsdtar -acf "../control.${_PKGEXT}" *

  cd ${debdir}
  ar r "${_workdir}/${name}-${pkgver}-amd64.deb" debian-binary "control.${_PKGEXT}" "data.${_PKGEXT}"
  '
done
