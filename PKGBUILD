# Maintainer (master-pro branch): KillWolfVlad <github.com/KillWolfVlad>
# Maintainer (master branch): Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>

_pkgname=gitkraken
pkgname="${_pkgname}-pro"
pkgrel=3
pkgver=2.6.0
pkgdesc='The most popular Git GUI for Arch Linux with Pro features.'
url='https://www.gitkraken.com/'
conflicts=(${_pkgname})
provides=(${conflicts[@]} ${pkgname})
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libxss')
makedepends=('nodejs' 'npm' 'python2')
backup=()
install=''
source=(
    'gitkraken-pro.sh'
    'gitkraken-pro.sha256'
    'gitkraken.desktop'
    'gitkraken.png'
    'gitkraken.sh'
)
sha256sums=('dc2cb75170a4dd04533333c77325321448af884168816a9c1473375266b83d04'
            'ae7a4c76d7995fd5d9d2fc36083cf7134efc0a000791932df0e5e44e726a2082'
            'c001122608370bc43d6cfefd8e217f337a07f544c351179e816983635f8ff45d'
            'a2b3551f83bcbe56da961615f066bb736cd15d98e41c93b3b4add0d56606d902'
            '338a4c72ad0efd9f15d92e12f69872aba3adf832bb8a16ed16decdc5fdca03c3')

build() {
    bash "gitkraken-pro.sh"
}

package() {
    install -d "${pkgdir}/opt"
    cp -R "./${pkgname}-${pkgver}" "${pkgdir}/opt/gitkraken"

    find "${pkgdir}/opt/gitkraken/" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/gitkraken/electron"

    install -d "${pkgdir}/usr/bin"

    install -D -m755 "./gitkraken.sh" "${pkgdir}/usr/bin/gitkraken"
    install -D -m644 "./gitkraken.desktop" "${pkgdir}/usr/share/applications/gitkraken.desktop"
    install -D -m644 "./gitkraken.png" "${pkgdir}/usr/share/pixmaps/gitkraken.png"
}
