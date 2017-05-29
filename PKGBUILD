# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>

pkgname=gitkraken-pro
pkgrel=2
pkgver=2.6.0
nodegitver=0.18.3
electronver=1.2.8
gitcrackenver=176qyaL1
pkgdesc="The most popular Git GUI for Arch Linux with Pro features."
url="https://www.gitkraken.com/"
provides=('gitkraken-pro')
conflicts=('gitkraken')
replaces=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libxss')
makedepends=('nodejs' 'npm' 'python2' 'b2t=0.0.0_alpha')
backup=()
install=''
source=(
    "gitkraken-${pkgver}.tar.gz::https://release.gitkraken.com/linux/v${pkgver}.tar.gz"
    "GitKraken.desktop"
    "gitkraken.png"
    "eula.html"
    "gitkraken.sh"
    "GitCracken-${gitcrackenver}.tar.xz.txt::https://pastebin.com/raw/${gitcrackenver}"
)
sha256sums=('0e51841e518db6f8ad831eba23caad5355cfa23b8cfe742e53a9283d816bcb9d'
            '5b3294331463f7fd983e78f8f54e293d66150b833db164ee1e4137e038846bc4'
            'a2b3551f83bcbe56da961615f066bb736cd15d98e41c93b3b4add0d56606d902'
            '9566342308bf35b56e626fa1b0d716eb16991712cc43b617c4f0d95e005311d1'
            '06123d2f9cae2d59468c5f92a76bce8c0077fc98a62c3c3f65e842d5de962e6c'
            '0583b9c4f342870b814c557d827fff020c0e3a65a53d9ab7714212468a27579a')

build() {
    mkdir "$srcdir"/nodegit && cd "$_"
    npm i nodegit@"$nodegitver"
    cd node_modules/nodegit
    HOME=./.electron-gyp node-gyp rebuild --target="$electronver" --arch=x64 --dist-url=https://atom.io/download/electron
    cp build/Release/nodegit.node "$srcdir"/gitkraken/resources/app.asar.unpacked/node_modules/nodegit/build/Release
}

package() {
    cd "$srcdir"
    b2t d GitCracken-"$gitcrackenver".tar.xz.txt -o GitCracken.tar.xz
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
