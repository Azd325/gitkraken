# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>

pkgname=gitkraken
pkgrel=3
pkgver=2.6.0
_systemidletimever=1.0.4
_findgitrepositoriesver=0.1.0
_keyboardlayoutver=1.0.0
_keytarver=3.0.0
_nodegitver=0.18.3
_nsfwver=1.0.14
_pathwatcherver=6.3.2
_runasver=3.1.1
_segfaulthandlerver=1.0.0
_electronver=1.6.10
pkgdesc="The most popular Git GUI for Arch Linux."
url="https://www.gitkraken.com/"
provides=('gitkraken')
conflicts=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libxss')
makedepends=('nodejs' 'npm' 'python2' 'asar')
backup=()
install=''
source=(
    "gitkraken-${pkgver}.tar.gz::https://release.gitkraken.com/linux/v${pkgver}.tar.gz"
    "electron-${_electronver}.zip::https://github.com/electron/electron/releases/download/v${_electronver}/electron-v${_electronver}-linux-x64.zip"
    "GitKraken.desktop"
    "gitkraken.png"
    "eula.html"
    "gitkraken.sh"
)
sha256sums=('0e51841e518db6f8ad831eba23caad5355cfa23b8cfe742e53a9283d816bcb9d'
            '5bbd7e988b64fca550f6448e5d41db736caf06ad209428611a9fba4642103926'
            '5b3294331463f7fd983e78f8f54e293d66150b833db164ee1e4137e038846bc4'
            'a2b3551f83bcbe56da961615f066bb736cd15d98e41c93b3b4add0d56606d902'
            '9566342308bf35b56e626fa1b0d716eb16991712cc43b617c4f0d95e005311d1'
            '02e3ddb2dfa1e84b82dcadd49bee7964510b22b586f25f2a4a5cf1190cfe3224')

noextract=("${source[1]%%::*}")

prepare() {
    mkdir "$srcdir"/electron && cd "$_" && bsdtar zxf ../electron-${_electronver}.zip
    asar e "$srcdir"/gitkraken/resources/app.asar "$srcdir"/app
}

rebuild_node() {
    mkdir -p "$srcdir"/"$1" && cd "$_"
    npm i "$1"@"$3"
    cd node_modules/"$1"
    HOME=./.electron-gyp node-gyp rebuild --target="$_electronver" --arch=x64 --dist-url=https://atom.io/download/electron
    cp build/Release/"$2".node "$srcdir"/app/node_modules/"$1"/build/Release
}

build() {
    rebuild_node @paulcbetts/system-idle-time system_idle_time "$_systemidletimever"
    rebuild_node find-git-repositories findGitRepos "$_findgitrepositoriesver"
    rebuild_node keyboard-layout keyboard-layout-observer "$_keyboardlayoutver"
    rebuild_node keytar keytar "$_keytarver"
    rebuild_node nodegit nodegit "$_nodegitver"
    rebuild_node nsfw nsfw "$_nsfwver"
    rebuild_node pathwatcher pathwatcher "$_pathwatcherver"
    rebuild_node runas runas "$_runasver"
    rebuild_node segfault-handler segfault-handler "$_segfaulthandlerver"
    asar p "$srcdir"/app "$srcdir"/app.asar
}

package() {
    cd "$srcdir"

    install -d "$pkgdir"/opt
    cp -R "$srcdir"/electron "$pkgdir"/opt/gitkraken
    cp "$srcdir"/app.asar "$pkgdir"/opt/gitkraken/resources/

    find "$pkgdir"/opt/gitkraken/ -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir"/opt/gitkraken/electron

    install -d "$pkgdir"/usr/bin

    install -D -m755 "./gitkraken.sh" "${pkgdir}/usr/bin/gitkraken"
    install -D -m644 "./eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/eula.html"
    install -D -m644 "./GitKraken.desktop" "${pkgdir}/usr/share/applications/GitKraken.desktop"
    install -D -m644 "./gitkraken.png" "${pkgdir}/usr/share/pixmaps/gitkraken.png"
}

#                              /:/            /::::::\            \:\
#                            /:/           /::::::::::::\           \:\
#                          /::/          /::::::::::::::::\          \::\
#                        /::/          /::::::::::::::::::::\          \::\
#                      /::/           /::::::::::::::::::::::\           \::\
#                    /::/            /::::::::::::::::::::::::\            \::\
#                   /::/            /::::::::::::::::::::::::::\            \::\
#         /        /::/           /::::::::::::::::::::::::::::::\           \::\        \
#       /:/       /::/           /::::::::::::::::::::::::::::::::\           \::\       \:\
#     /:/        /::/           /::::::::::::::::::::::::::::::::::\           \::\        \:\
#    ::|        /::/           |::::::::::::::::::::::::::::::::::::|           \::\        |::
#  /::/         ::|            |::::::::::::::::::::::::::::::::::::|            |::         \::\
# /::|         /::/             \::::::::::::::::::::::::::::::::::/             \::\         |::\
# |::|        /::|                \::::::::::::::::::::::::::::::/                |::\        |::|
# |::|        |::|                 |::::::::::::::::::::::::::::|                 |::|        |::|
# \::|        |::|                  \::::::::::::::::::::::::::/                  |::|        |::/
# \::\       \::|                   |::::::::::::::::::::::::|                   |::/       /::/
#  ::|        \::\                  |::::::::::::::::::::::::|                  /::/        |::
#  \::\        ::|                  |: :::::::::::::::::::: :|                  |::        /::/
#   \::\       \::\                /       ::::::::::::       \                /::/       /::/
#    \::\       \::\              /        ::::::::::::        \              /::/       /::/
#     \::\       \::\             |       ::::::::::::::       |             /::/       /::/
#      \::\       \::\              \::::::::::::::::::::::::/              /::/       /::/
#       \::\       \::\              |::::::::::::::::::::::|              /::/       /::/
#        \::\       \::\             |::|  |::|    |::|  |::|             /::/       /::/
#          \::\       \::\           |::|  |::|    |::|  |::|           /::/       /::/
#           \::\        \:::\        |::|  |::|    |::|  |::|        /:::/        /::/
#            \::\          \:::\     |::|  |::|    |::|  |::|     /:::/          /::/
#               \:::\        \:::\___|::|  |::|    |::|  |::|___/:::/        /:::/
#                 \:::\        \::::::::|  |::|    |::|  |::::::::/        /:::/
#                    \:::\                 |::|    |::|                 /:::/
#                      \:::\               |::|    |::|               /:::/
#                        \:::\             |::|    |::|             /:::/
#                          \:::\___________|::|    |::|___________/:::/
#                             \:::::::::::::::|    |:::::::::::::::/
