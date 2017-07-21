# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>

pkgname=gitkraken
pkgrel=2
pkgver=2.7.0
pkgdesc="The intuitive, fast, and beautiful cross-platform Git client."
url="https://www.gitkraken.com/"
provides=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libcurl-openssl-1.0' 'libxss')
makedepends=('git' 'gtk-doc')  # needed to build pango
backup=()
install=''
source=(
    "git+https://git.gnome.org/browse/pango#commit=6c5d1d35061a91c3c0792f7720da3f8308ebff65"
    "${pkgname}-${pkgver}.tar.gz::https://release.gitkraken.com/linux/v${pkgver}.tar.gz"
    "GitKraken.desktop"
    "gitkraken.png"
    "eula.html"
    "gitkraken.sh"
)
sha256sums=('SKIP'
            'd6380a2ad29fdeeca05a4318f3c5db76db6a21c7359c34db6074a7a45cbc5301'
            '5b3294331463f7fd983e78f8f54e293d66150b833db164ee1e4137e038846bc4'
            'a2b3551f83bcbe56da961615f066bb736cd15d98e41c93b3b4add0d56606d902'
            '9566342308bf35b56e626fa1b0d716eb16991712cc43b617c4f0d95e005311d1'
            '28c1e28104c23937404448c38ee26dac75c01fb4398e1fad057599da24135b9e')

### BEGIN pango section ###
prepare() {
    cd pango
    NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/pango"
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${srcdir}/pango"
  make -k check || :
}
### END pango section ###


package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir"/gitkraken "$pkgdir"/opt/gitkraken

    find "$pkgdir"/opt/gitkraken/ -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir"/opt/gitkraken/gitkraken

    install -d "$pkgdir"/usr/bin

    install -D -m755 "./gitkraken.sh" "${pkgdir}/usr/bin/gitkraken"
    install -D -m644 "./eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/eula.html"
    install -D -m644 "./GitKraken.desktop" "${pkgdir}/usr/share/applications/GitKraken.desktop"
    install -D -m644 "./gitkraken.png" "${pkgdir}/usr/share/pixmaps/gitkraken.png"

    ### BEGIN pango section ###
    install -Dm755 "${srcdir}/pango/pango/.libs/libpangoft2-1.0.so.0.4000.5" \
                   "${pkgdir}/opt/gitkraken/libpangoft2-1.0.so.0.4000.5"
    ln -s "libpangoft2-1.0.so.0.4000.5" "${pkgdir}/opt/gitkraken/libpangoft2-1.0.so.0"
    ### END pango section ###

}
