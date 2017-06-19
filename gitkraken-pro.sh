#!/usr/bin/env bash

# Maintainer: KillWolfVlad <github.com/KillWolfVlad>

_workdir=$(pwd)
_scriptdir=$(dirname $0)
_gitkrakenver=2.6.0
_electronver=1.6.11
_gitcrackenver=17ZX1Are
_systemidletimever=1.0.4
_findgitrepositoriesver=0.1.0
_keyboardlayoutver=1.0.0
_keytarver=3.0.0
_nodegitver=0.18.3
_nsfwver=1.0.14
_pathwatcherver=6.3.2
_runasver=3.1.1
_segfaulthandlerver=1.0.0

remote=(
  https://release.gitkraken.com/linux/v${_gitkrakenver}.tar.gz
  https://github.com/electron/electron/releases/download/v${_electronver}/electron-v${_electronver}-linux-x64.zip
  https://pastebin.com/raw/${_gitcrackenver}
)

local=(
  ${_workdir}/gitkraken-${_gitkrakenver}.tar.gz
  ${_workdir}/electron-${_electronver}.zip
  ${_workdir}/gitcracken-${_gitcrackenver}.tar.xz.txt
)

download() {
  for (( i=0; i < ${#remote[@]}; ++i )); do
    if [ ! -f ${local[$i]} ]; then
      curl -L ${remote[$i]} -o ${local[$i]}
      if [[ $? != 0 ]]; then exit $?; fi
    fi
  done
}

checksum() {
  sha256sum -c ${_scriptdir}/gitkraken-pro.sha256
  if [[ $? != 0 ]]; then exit $?; fi
}

prepare() {
  # GitKraken
  mkdir -p ${_workdir}/gitkraken-${_gitkrakenver}
  bsdtar xvf ${local[0]} -C ${_workdir}/gitkraken-${_gitkrakenver}
  _resources=${_workdir}/gitkraken-${_gitkrakenver}/gitkraken/resources
  # Electron
  mkdir -p ${_workdir}/gitkraken-pro-${_gitkrakenver}
  bsdtar zxf ${local[1]} -C ${_workdir}/gitkraken-pro-${_gitkrakenver}
  _resources_pro=${_workdir}/gitkraken-pro-${_gitkrakenver}/resources
  # GitCracken
  mkdir -p ${_workdir}/gitcracken-${_gitcrackenver}
  base64 -d ${local[2]} > ${_workdir}/gitcracken-${_gitcrackenver}.tar.xz
  bsdtar xpvf ${_workdir}/gitcracken-${_gitcrackenver}.tar.xz -C ${_workdir}/gitcracken-${_gitcrackenver}
  cd ${_workdir}/gitcracken-${_gitcrackenver}/GitCracken && npm i
  _gitcracken=${_workdir}/gitcracken-${_gitcrackenver}/GitCracken/bin/gitcracken.js
  node ${_gitcracken} unpack --asar ${_resources}/app.asar --asar-directory ${_resources}/app -v
  node ${_gitcracken} patch-directory --asar-directory ${_resources}/app -v
}

rebuild_node() {
  mkdir -p ${_workdir}/gitkraken-modules-${_gitkrakenver} && cd $_
  npm i $1@$3
  cd node_modules/$1
  HOME=./.electron-gyp node-gyp rebuild --target=${_electronver} --arch=x64 --dist-url=https://atom.io/download/electron
  cp build/Release/$2.node ${_resources}/app/node_modules/$1/build/Release
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
}

package() {
  node ${_gitcracken} pack --asar ${_resources_pro}/app.asar --asar-directory ${_resources}/app -v
}

download
checksum
prepare
build
package

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
