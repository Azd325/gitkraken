# Maintainer (master-pro branch): KillWolfVlad <github.com/KillWolfVlad>
# Maintainer (master branch): Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>

pkgbase=gitkraken-pro
pkgname=('gitkraken-pro' 'gitkraken-enterprise')
pkgrel=1
pkgver=2.7.1
pkgdesc='The most popular Git GUI for Arch Linux.'
url='https://github.com/KillWolfVlad/GitKraken-Pro-AUR/'
provides=('gitkraken' 'gitkraken-pro')
conflicts=('gitkraken' 'gitkraken-pro' 'gitkraken-enterprise')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libxss')
makedepends=('nodejs' 'npm' 'python2')
source=(
  'gitkraken-pro.sh'
  'gitkraken-pro.sha256'
  'gitkraken.desktop'
  'gitkraken.png'
  'gitkraken.sh'
)
sha256sums=('097fd84d20c759e1245eaf7f3ab53830b2415070756abb04d33a0438be78c560'
            '33aed54b4c6bea50ae608628cbc8eb490c438f16cb29b8f697607835f5cc6668'
            '5b3294331463f7fd983e78f8f54e293d66150b833db164ee1e4137e038846bc4'
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
