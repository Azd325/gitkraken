# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor and Hacker: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Samuel Littley <samuel@samuellittley.me>

pkgname=gitkraken-pro
pkgrel=2
pkgver=2.2.0
b2tver=0.0.0-alpha
pastebinurl=mvEyx6EC
pkgdesc="The intuitive, fast, and beautiful cross-platform Git client [Pro Version]."
url="http://www.gitkraken.com/"
provides=('gitkraken-pro')
conflicts=('gitkraken')
replaces=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libnotify' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libcurl-compat')
makedepends=('nodejs>=7.7.2' 'npm>=4.4.1' 'mono>=4.8.0')
backup=()
install=''
source=(
    "https://release.gitkraken.com/linux/v${pkgver}.tar.gz"
    "GitKraken.desktop"
    "gitkraken.png"
    "eula.html"
    "gitkraken.sh"
    "https://github.com/KillWolfVlad/b2t/releases/download/v${b2tver}/b2t.tar.xz"
    "http://pastebin.com/raw/${pastebinurl}"
)
md5sums=('60ef26ca66f7d73ae29e53b557b69350'
         '55f11789f5a9ee9fc4989d0f06eee260'
         '04987b933d551d15c0813111d715bb9e'
         'e9ba6663e5f1f92cae31beb0074e8c6c'
         'e3063947b063aaccf4dc17ed47437ea8'
         '85a40827cffdcddc04115ab177c94448'
         '94c01aa1af2186fb0a9a1b15e33ed843')

package() {
    cd "$srcdir"
    mono ./b2t.exe d "$pastebinurl" -o GitCracken.tar.xz
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
