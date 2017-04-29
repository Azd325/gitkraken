# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>

pkgname=gitkraken-pro
pkgrel=4
pkgver=2.4.0
pastebinurl=176qyaL1
pkgdesc="The intuitive, fast, and beautiful cross-platform Git client [Pro Version]."
url="http://www.gitkraken.com/"
provides=('gitkraken-pro')
conflicts=('gitkraken')
replaces=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libcurl-openssl-1.0' 'libxss')
makedepends=('nodejs>=7.9.0' 'npm>=4.5.0' 'b2t=0.0.0_alpha')
backup=()
install=''
source=(
    "https://release.gitkraken.com/linux/v${pkgver}.tar.gz"
    "GitKraken.desktop"
    "gitkraken.png"
    "eula.html"
    "gitkraken.sh"
    "https://pastebin.com/raw/${pastebinurl}"
)
md5sums=('560d36ce2651aacb2f2296fb6771f05c'
         '55f11789f5a9ee9fc4989d0f06eee260'
         '04987b933d551d15c0813111d715bb9e'
         'e9ba6663e5f1f92cae31beb0074e8c6c'
         '4c7a550e9abee9d2c4ab6046736e9113'
         '41036b86067661fa4539c172319f253b')

package() {
    cd "$srcdir"
    b2t d "$pastebinurl" -o GitCracken.tar.xz
    tar xpvf ./GitCracken.tar.xz
    cd "$srcdir"/GitCracken/
    npm i
    node ./bin/gitcracken.js -p -d "$srcdir"/gitkraken/resources/
    rm "$srcdir"/gitkraken/resources/app.asar.*.backup
    cd "$srcdir"

    install -d "$pkgdir"/opt
    cp -R "$srcdir"/gitkraken "$pkgdir"/opt/gitkraken

    find "$pkgdir"/opt/gitkraken/ -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir"/opt/gitkraken/gitkraken

    install -d "$pkgdir"/usr/bin

    install -D -m755 "./gitkraken.sh" "${pkgdir}/usr/bin/gitkraken"
    install -D -m644 "./eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/eula.html"
    install -D -m644 "./GitKraken.desktop" "${pkgdir}/usr/share/applications/GitKraken.desktop"
    install -D -m644 "./gitkraken.png" "${pkgdir}/usr/share/pixmaps/gitkraken.png"
}
