# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>

# Uncomment to rebuild GitKraken specially for your platform
# (using electron from GitHub)
# Required disk space for build: ~5 GB
# Build time: ~20 min
# Works on Arch Linux & Manjaro!
#_electron=1.8.6

pkgname=gitkraken
pkgrel=1
pkgver=3.6.0
pkgdesc='The intuitive, fast, and beautiful cross-platform Git client.'
url='https://www.gitkraken.com/'
provides=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libcurl-gnutls' 'libxss' 'rtmpdump')
optdepends=('git-lfs: git-lfs support')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://release.gitkraken.com/linux/v${pkgver}.tar.gz"
  "GitKraken.desktop"
  "gitkraken.png"
  "eula.html"
  "gitkraken.sh"
)
sha256sums=('511fc3b7f1bff0183bafa67ed32d1d015feeb6bbcdd5a30f7813bfdadd9001a6'
            'c001122608370bc43d6cfefd8e217f337a07f544c351179e816983635f8ff45d'
            'a2b3551f83bcbe56da961615f066bb736cd15d98e41c93b3b4add0d56606d902'
            '9566342308bf35b56e626fa1b0d716eb16991712cc43b617c4f0d95e005311d1'
            '3a7bc0c2f6bce99850f31a082c85b0922992d91e18f9cb5592e0b776de2e55a7')

if [[ $_electron ]]; then
  unset depends['libcurl-gnutls']
  makedepends=('nodejs-lts-carbon' 'npm' 'python2' 'yarn' 'asar' 'jq' 'libxkbfile')
  source+=("electron-${_electron}.zip::https://github.com/electron/electron/releases/download/v${_electron}/electron-v${_electron}-linux-x64.zip")
  sha256sums+=('e9b60ef5998f210ba7374a806b38bf9c0cb7999eb85029ce15aedb60c55ba192')
  noextract=("${source[-1]%%::*}")
fi

prepare() {
  if [[ $_electron ]]; then
    msg2 "Unpack electron"
    mkdir -p "./electron"
    bsdtar zxf "${srcdir}/${source[-1]%%::*}" -C "./electron"
    msg2 "Unpack app.asar"
    asar e "./gitkraken/resources/app.asar" "./gitkraken/resources/app"
  fi
}

build() {
  if [[ $_electron ]]; then
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
  fi
}

package_copy() {
  cp -R "./$1" "${pkgdir}/opt/gitkraken"
  find "$pkgdir/opt/gitkraken/" -type f -exec chmod 644 {} \;
  chmod 755 "$pkgdir/opt/gitkraken/$1"
}

package() {
  install -d "${pkgdir}/opt"

  if [[ $_electron ]]; then
    msg2 "Pack app.asar"
    asar p "./gitkraken/resources/app" "./electron/resources/app.asar"
    msg2 "Copy files"
    package_copy electron
  else
    package_copy gitkraken
  fi

  install -D -m755 "./gitkraken.sh" "${pkgdir}/usr/bin/gitkraken"
  install -D -m644 "./eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/eula.html"
  install -D -m644 "./GitKraken.desktop" "${pkgdir}/usr/share/applications/GitKraken.desktop"
  install -D -m644 "./gitkraken.png" "${pkgdir}/usr/share/pixmaps/gitkraken.png"
}
