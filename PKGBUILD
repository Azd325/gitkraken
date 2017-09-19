# Maintainer (master-pro branch): KillWolfVlad <github.com/KillWolfVlad>
# Maintainer (master branch): Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>

pkgbase=gitkraken-pro
pkgname=('gitkraken-pro' 'gitkraken-enterprise')
pkgrel=1
pkgver=3.0.1
pkgdesc='The most popular Git GUI for Arch Linux.'
url='https://github.com/KillWolfVlad/GitKraken-Pro-AUR/'
provides=('gitkraken' 'gitkraken-pro')
conflicts=('gitkraken' 'gitkraken-pro' 'gitkraken-enterprise')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libxss' 'rtmpdump')
makedepends=('nodejs' 'npm' 'python2')
optdepends=('git-lfs: git-lfs support')
source=(
  'gitkraken-pro.sh'
  'gitkraken-pro.sha256'
  'gitkraken.desktop'
  'gitkraken.png'
  'gitkraken.sh'
)
sha256sums=('dd7e7b01114a2d03726d0d8b439b099febafad9f2251a97315ffe7d3d2d41099'
            'e3508e19dda4565a1224ea928e1760f6a2e6ae16468eee8ff2a0174a313fe1e3'
            'c001122608370bc43d6cfefd8e217f337a07f544c351179e816983635f8ff45d'
            'a2b3551f83bcbe56da961615f066bb736cd15d98e41c93b3b4add0d56606d902'
            'e31fefd107a69e9364d28029027ca63de229b744e58b7b1b24a37bf7a29e67e0')

build() {
  bash "${srcdir}/gitkraken-pro.sh"
}

_package() {
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/$1-${pkgver}" "${pkgdir}/opt/gitkraken"

  find "${pkgdir}/opt/gitkraken/" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/opt/gitkraken/electron"

  install -d "${pkgdir}/usr/bin"

  install -D -m755 "${srcdir}/gitkraken.sh" "${pkgdir}/usr/bin/gitkraken"
  install -D -m644 "${srcdir}/gitkraken.desktop" "${pkgdir}/usr/share/applications/gitkraken.desktop"
  install -D -m644 "${srcdir}/gitkraken.png" "${pkgdir}/usr/share/pixmaps/gitkraken.png"
}

package_gitkraken-pro() {
  _package "gitkraken-pro"
}

package_gitkraken-enterprise() {
  provides+=('gitkraken-enterprise')
  _package "gitkraken-enterprise"
}
