# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>

pkgname=gitkraken
pkgrel=2
pkgver=2.5.0
nodegitver=0.18.3
electronver=1.2.8
pkgdesc="The intuitive, fast, and beautiful cross-platform Git client."
url="https://www.gitkraken.com/"
provides=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libxss')
makedepends=('nodejs>=7.7.3' 'npm>=4.5.0')
backup=()
install=''
source=(
    "https://release.gitkraken.com/linux/v${pkgver}.tar.gz"
    "GitKraken.desktop"
    "gitkraken.png"
    "eula.html"
    "gitkraken.sh"
)
md5sums=('a6dcbb4979b10ea7a865ffa742de8fa2'
         '55f11789f5a9ee9fc4989d0f06eee260'
         '04987b933d551d15c0813111d715bb9e'
         'e9ba6663e5f1f92cae31beb0074e8c6c'
         '6c504da03a5e7068a29a9618aa29a994')

build() {
    cd ${srcdir}
    mkdir nodegit && cd "$_"
    npm i nodegit@${nodegitver}
    cd node_modules/nodegit
    HOME=./.electron-gyp node-gyp rebuild --target=${electronver} --arch=x64 --dist-url=https://atom.io/download/electron
    cp build/Release/nodegit.node ${srcdir}/gitkraken/resources/app.asar.unpacked/node_modules/nodegit/build/Release
}

package() {
    cd ${srcdir}

    install -d ${pkgdir}/opt
    cp -R ${srcdir}/gitkraken ${pkgdir}/opt/gitkraken

    find ${pkgdir}/opt/gitkraken/ -type f -exec chmod 644 {} \;
    chmod 755 ${pkgdir}/opt/gitkraken/gitkraken

    install -d ${pkgdir}/usr/bin

    install -D -m755 "./gitkraken.sh" "${pkgdir}/usr/bin/gitkraken"
    install -D -m644 "./eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/eula.html"
    install -D -m644 "./GitKraken.desktop" "${pkgdir}/usr/share/applications/GitKraken.desktop"
    install -D -m644 "./gitkraken.png" "${pkgdir}/usr/share/pixmaps/gitkraken.png"
}
