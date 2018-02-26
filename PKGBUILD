# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>

_electron=1.6.17

pkgname=gitkraken
pkgrel=3
pkgver=3.3.4
pkgdesc='The legendary Git GUI client for Arch Linux'
url='https://www.gitkraken.com/'
provides=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libxss' 'rtmpdump')
makedepends=('nodejs' 'npm' 'python2' 'yarn' 'asar' 'jq' 'libxkbfile')
optdepends=('git-lfs: git-lfs support')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://release.gitkraken.com/linux/v${pkgver}.tar.gz"
  "electron-${_electron}.zip::https://github.com/electron/electron/releases/download/v${_electron}/electron-v${_electron}-linux-x64.zip"
  "eula.html"
  "gitkraken.desktop"
  "gitkraken.png"
  "gitkraken.sh"
)
noextract=("${source[1]%%::*}")
sha256sums=('43f232c4ab0c5fef8217dd7c5182f5b9c8fa7fcd2c296e59bbe957ce2dea1ddd'
            '2ac0cb34a64b21491f2816ec7f27d2464119d67629a4f2897d90b0b4ca492db7'
            '9566342308bf35b56e626fa1b0d716eb16991712cc43b617c4f0d95e005311d1'
            'c001122608370bc43d6cfefd8e217f337a07f544c351179e816983635f8ff45d'
            'a2b3551f83bcbe56da961615f066bb736cd15d98e41c93b3b4add0d56606d902'
            '2c959652997641b1d229bdf389df1fde27d6453b3f056bd1056c1cfbc44380b7')

prepare() {
  msg2 "Unpack electron"
  mkdir -p "./electron"
  bsdtar zxf "${srcdir}/${source[1]%%::*}" -C "./electron"
  
  msg2 "Unpack app.asar"
  asar e "./gitkraken/resources/app.asar" "./gitkraken/resources/app"
}

build() {
  local unpacked="${srcdir}/gitkraken/resources/app.asar.unpacked/node_modules"
  find "${unpacked}" -type f -name "*.node" -print0 | while IFS= read -r -d $'\0' name; do
    for ((i=0; i < 3; i++)); do
      name=$(dirname "${name}")
    done
    name="${name:${#unpacked}+1}"
    local version=$(jq -r .version "${srcdir}/gitkraken/resources/app/node_modules/${name}/package.json")
    msg2 "Rebuild ${name}@${version}"
    mkdir -p "${srcdir}/rebuild-node/${name}" && cd "$_"
    yarn --cache-folder "${srcdir}/rebuild-node" add "${name}"@"${version}"
    cd "node_modules/${name}"
    HOME="./.electron-gyp" node-gyp rebuild --target=${_electron} --arch=x64 --dist-url="https://atom.io/download/electron"
    cp "build/Release/"*.node "${srcdir}/gitkraken/resources/app/node_modules/${name}/build/Release"
  done
}

package() {
  msg2 "Pack app.asar"
  asar p "./gitkraken/resources/app" "./electron/resources/app.asar"

  msg2 "Copy files"
  install -d "${pkgdir}/opt"
  cp -R "./electron" "${pkgdir}/opt/gitkraken"

  find "${pkgdir}/opt/gitkraken/" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/opt/gitkraken/electron"

  install -D -m644 "./eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/eula.html"
  install -D -m644 "./gitkraken.desktop" "${pkgdir}/usr/share/applications/gitkraken.desktop"
  install -D -m644 "./gitkraken.png" "${pkgdir}/usr/share/pixmaps/gitkraken.png"
  install -D -m755 "./gitkraken.sh" "${pkgdir}/usr/bin/gitkraken"
}
