[![gitkraken logo](https://cdn.rawgit.com/KillWolfVlad/GitKraken-Pro-AUR/1f92490bcec748ea5986f4ea7b366f1d95628818/logo.svg)](https://www.gitkraken.com/)

[![forthebadge](https://forthebadge.com/images/badges/uses-git.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-js.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-html.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-css.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/powered-by-electricity.svg)](https://forthebadge.com)

# About

`GitKraken Pro` is project to make [GitKraken](https://www.gitkraken.com/) great again. We love this program, but it does not work the way we want.

What we do (for more details see [script](#-gitkraken-pro) notes)?

1. Rebuild `GitKraken` with working `electron` version (specially for your platform)
2. Unlock `Pro` or `Enterprise` editions for you (absolutely free)

We support various platforms:

- [Arch Linux](#i-love-arch-linux-and-i-use-it)
- [Manjaro](#i-love-arch-way-and-i-use-manjaro)
- Other linux distributions (only [common instructions](#-gitkraken-pro))
- Windows (only [Patcher](#gitcracken-aka-patcher))
- macOS (only [Patcher](#gitcracken-aka-patcher))

# About Enterprise Server

Also we provide own (cross-platform, free, open-source, lightweight, without external dependencies e.g. databases) realisation of [GitKraken's Enterprise Server](https://www.gitkraken.com/enterprise). For more details see [Patcher](#gitcracken-aka-patcher) notes. Or try connect to our enterprise server now:

```
https://gitcracken-enterprise-server.herokuapp.com/
```

Login or register with any email and password on `Enterprise` edition!

> Warning! Our heroku server use free account, due to which its performance may not meet your expectations!

> Warning! We don't store information about you, don't track you and etc.

# Need help or you want help?

1. Open issue
2. Send PR
3. Or write me to [vk](https://vk.com/killwolfvlad)

# I love Arch Linux and I use it

`Arch Linux` is main platform to support. Just download [latest release](https://github.com/KillWolfVlad/GitKraken-Pro-AUR/releases/latest) source code, extract archive, open your favorite terminal in directory with `PKGBUILD` and type:

- `makepkg -ifs` if you want install `Pro` edition
- `GITKRAKEN_ENABLE_ENTERPRISE=y makepkg -ifs` if you want install `Enterprise` edition

After installation you can login or register with your real email and password (on `Pro` edition) or connnect to `GitKraken's Enterprise Server` (on `Enterprise` edition) (see [enterprise](#about-enterprise-server) notes for more details)

You can say: "Why I can't find this wonderful `PKGBUILD` in `AUR`?". `gitkraken-pro` [was deleted](https://lists.archlinux.org/pipermail/aur-requests/2017-February/016054.html) from `AUR`.

# I love Arch Way and I use Manjaro

See instruction for [Arch Linux](#i-love-arch-linux-and-i-use-it)

# #! GitKraken Pro

`gitkraken-pro.sh` is linux invariant (neutral) script to rebuild `GitKraken` with working `electron` version for your platform and apply several patches via [GitCracken aka Patcher](#gitcracken-aka-patcher) to unlock `Pro` or `Enterprise` editions.

How to use this script?

1. Install dependencies (different systems require different dependencies)
2. Put `gitkraken-pro.sh` and `gitkraken-pro.sha256` to any drectory (better without spaces [nodejs/node-gyp#65](https://github.com/nodejs/node-gyp/issues/65))
3. Run `gitkraken-pro.sh` to build `Pro` edition
4. Run `GITKRAKEN_ENABLE_ENTERPRISE=y gitkraken-pro.sh` to build `Enterprise` edition
5. You can find your files in `gitkraken-<edition>-<version>` directory
6. Execute `electron` file and enjoy!
7. You can login or register with your real email and password (on `Pro` edition) or connnect to `GitKraken's Enterprise Server` (on `Enterprise` edition) (see [enterprise](#about-enterprise-server) notes for more details)

# GitCracken aka Patcher

`GitCracken` ([was deleted](https://github.com/github/dmca/blob/master/2017/2017-02-28-GitKraken.md) from `GitHub`, but the development continues in private repo :smile:) is auto patcher and non-commercial utils for `GitKraken`. You can use it standalone on your `Linux`, `Windows` or `macOS`. You can find link to the latest version in [releases](https://github.com/KillWolfVlad/GitKraken-Pro-AUR/releases). Download text file and decode it by `base64`. You should get `*.tar.xz` archive. Extract it. Read `README`, `CHANGELOG` and see

```bash
node bin/gitcracken.js --help
```

for more usage information (don't forget install modules `npm i`).

## Common commands

Auto patch installed `GitKraken` (maybe require `sudo` privileges)

```bash
node bin/gitcracken.js patch
```

For unlock `Enterprise` edition

```bash
node bin/gitcracken.js patch --feature enterprise
```

Start `GitCracken's Enterprise Server` (login or register with any email and password on `Enterprise` edition)

```bash
node bin/gitcracken.js enterprise-server
```

Build for older `nodejs`

```bash
npm run build
```

```bash
node dest/bin/gitcracken.js --help
```
