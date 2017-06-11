# Maintainer (master branch): Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Maintainer (master-pro branch): KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>

_pkgname=gitkraken
pkgname=${_pkgname}-pro
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
_gitcrackenver=17ZX1Are
pkgdesc='The most popular Git GUI for Arch Linux with Pro features.'
url='https://www.gitkraken.com/'
conflicts=(${_pkgname})
provides=(${conflicts[@]} ${pkgname})
_arch=x64
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libxss')
makedepends=('nodejs' 'npm' 'python2')
backup=()
install=''
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://release.gitkraken.com/linux/v${pkgver}.tar.gz"
    "electron-${_electronver}.zip::https://github.com/electron/electron/releases/download/v${_electronver}/electron-v${_electronver}-linux-${_arch}.zip"
    "GitCracken-${_gitcrackenver}.tar.xz.txt::https://pastebin.com/raw/${_gitcrackenver}"
    "GitKraken.desktop"
    "gitkraken.png"
    "eula.html"
    "gitkraken.sh"
)
noextract=(${source[1]%%::*})
sha256sums=('0e51841e518db6f8ad831eba23caad5355cfa23b8cfe742e53a9283d816bcb9d'
            '5bbd7e988b64fca550f6448e5d41db736caf06ad209428611a9fba4642103926'
            '2c0086450d489d75200833bf8e151a9204055ef413a80a8df5acf33c72882c13'
            '5b3294331463f7fd983e78f8f54e293d66150b833db164ee1e4137e038846bc4'
            'a2b3551f83bcbe56da961615f066bb736cd15d98e41c93b3b4add0d56606d902'
            '9566342308bf35b56e626fa1b0d716eb16991712cc43b617c4f0d95e005311d1'
            '338a4c72ad0efd9f15d92e12f69872aba3adf832bb8a16ed16decdc5fdca03c3')

prepare() {
    mkdir ./electron && cd $_ && bsdtar zxf ../electron-${_electronver}.zip && cd -
    base64 -d ./GitCracken-${_gitcrackenver}.tar.xz.txt > ./GitCracken.tar.xz
    bsdtar xpvf ./GitCracken.tar.xz && cd ./GitCracken && npm i
    node ./bin/gitcracken.js unpack --asar ${srcdir}/gitkraken/resources/app.asar --asar-directory ${srcdir}/app -v
    node ./bin/gitcracken.js patch-directory --asar-directory ${srcdir}/app -v
}

rebuild_node() {
    mkdir -p ${srcdir}/$1 && cd $_
    npm i $1@$3
    cd node_modules/$1
    HOME=./.electron-gyp node-gyp rebuild --target=${_electronver} --arch=${_arch} --dist-url=https://atom.io/download/electron
    cp build/Release/$2.node ${srcdir}/app/node_modules/$1/build/Release
}

build() {
    rebuild_node @paulcbetts/system-idle-time system_idle_time ${_systemidletimever}
    rebuild_node find-git-repositories findGitRepos ${_findgitrepositoriesver}
    rebuild_node keyboard-layout keyboard-layout-observer ${_keyboardlayoutver}
    rebuild_node keytar keytar ${_keytarver}
    rebuild_node nodegit nodegit ${_nodegitver}
    rebuild_node nsfw nsfw ${_nsfwver}
    rebuild_node pathwatcher pathwatcher ${_pathwatcherver}
    rebuild_node runas runas ${_runasver}
    rebuild_node segfault-handler segfault-handler ${_segfaulthandlerver}
    node ${srcdir}/GitCracken/bin/gitcracken.js pack --asar-directory ${srcdir}/app -v
}

package() {
    install -d ${pkgdir}/opt
    cp -R ./electron ${pkgdir}/opt/gitkraken
    cp ./app.asar ${pkgdir}/opt/gitkraken/resources

    find ${pkgdir}/opt/gitkraken/ -type f -exec chmod 644 {} \;
    chmod 755 ${pkgdir}/opt/gitkraken/electron

    install -d ${pkgdir}/usr/bin

    install -D -m755 ./gitkraken.sh ${pkgdir}/usr/bin/gitkraken
    install -D -m644 ./eula.html ${pkgdir}/usr/share/licenses/${pkgname}/eula.html
    install -D -m644 ./GitKraken.desktop ${pkgdir}/usr/share/applications/GitKraken.desktop
    install -D -m644 ./gitkraken.png ${pkgdir}/usr/share/pixmaps/gitkraken.png
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
