# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>

pkgname=gitkraken-pro
pkgrel=4
pkgver=2.1.0
gitcrackenver=0.1.0
pkgdesc="The intuitive, fast, and beautiful cross-platform Git client [Pro Version]."
url="http://www.gitkraken.com/"
provides=('gitkraken-pro')
conflicts=('gitkraken')
replaces=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libnotify' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libcurl-compat')
makedepends=('nodejs>=7.6.0' 'npm>=4.2.0')
backup=()
install=''
source=(
    "https://release.gitkraken.com/linux/v${pkgver}.tar.gz"
    "GitKraken.desktop"
    "gitkraken.png"
    "eula.html"
    "https://github.com/KillWolfVlad/GitCracken/archive/v${gitcrackenver}.tar.gz"
)
md5sums=('075de0a5610f6dc488563fe769d731c6'
         'ecef298bed1178d60cf0dd75c4700205'
         '04987b933d551d15c0813111d715bb9e'
         'e9ba6663e5f1f92cae31beb0074e8c6c'
         '33d7580702607862ad95f7f4e5807e83')

package() {
    cd "$srcdir"/GitCracken-"$gitcrackenver"/
    npm i
    node ./bin/gitcracken.js -p -d "$srcdir"/gitkraken/resources/
    rm "$srcdir"/gitkraken/resources/app.asar.*.backup
    cd "$srcdir"

    install -d "$pkgdir"/opt
    cp -R "$srcdir"/gitkraken "$pkgdir"/opt/gitkraken

    find "$pkgdir"/opt/gitkraken/ -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir"/opt/gitkraken/gitkraken

    install -d "$pkgdir"/usr/bin
    ln -s ../../opt/gitkraken/gitkraken "$pkgdir"/usr/bin/gitkraken

    install -D -m644 "./eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/eula.html"
    install -D -m644 "./GitKraken.desktop" "${pkgdir}/usr/share/applications/GitKraken.desktop"
    install -D -m644 "./gitkraken.png" "${pkgdir}/usr/share/pixmaps/gitkraken.png"
}
