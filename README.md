[![gitkraken logo](https://cdn.rawgit.com/KillWolfVlad/GitKraken-Pro-AUR/1f92490bcec748ea5986f4ea7b366f1d95628818/logo.svg)](https://www.gitkraken.com/)

[![forthebadge](https://forthebadge.com/images/badges/uses-git.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-js.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-html.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-css.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/built-by-codebabes.svg)](https://forthebadge.com)

# How I can help update package?

1. Download latest `*.deb` package and add or remove dependencies in `PKGBUILD/depends`
2. Update package version in `PKGBUILD/pkgver`
3. Update package release in `PKGBUILD/pkgrel`
4. Update `GitCracken` version in `PKGBUILD/_gitcrackenver`
5. Update `Electron` version in `PKGBUILD/_electronver`
6. Update [@paulcbetts/system-idle-time](https://www.npmjs.com/package/@paulcbetts/system-idle-time) version in `PKGBUILD/_systemidletimever`
7. Update [find-git-repositories](https://www.npmjs.com/package/find-git-repositories) version in `PKGBUILD/_findgitrepositoriesver`
8. Update [keyboard-layout](https://www.npmjs.com/package/keyboard-layout) version in `PKGBUILD/_keyboardlayoutver`
9. Update [keytar](https://www.npmjs.com/package/keytar) version in `PKGBUILD/_keytarver`
10. Update [nodegit](https://www.npmjs.com/package/nodegit) version in `PKGBUILD/_nodegitver`
11. Update [nsfw](https://www.npmjs.com/package/nsfw) version in `PKGBUILD/_nsfwver`
12. Update [pathwatcher](https://www.npmjs.com/package/pathwatcher) version in `PKGBUILD/_pathwatcherver`
13. Update [runas](https://www.npmjs.com/package/runas) version in `PKGBUILD/_runasver`
14. Update [segfault-handler](https://www.npmjs.com/package/segfault-handler) version in `PKGBUILD/_segfaulthandlerver`
15. Add or remove native `node` modules, that needed to rebuild
16. Generate new checksums

```bash
updpkgsums
```

17. Update `.SRCINFO`

```bash
makepkg --printsrcinfo > .SRCINFO
```

18. Try build and install package

```bash
makepkg -ifs
```

# How I can help with GitCracken aka Patcher?

GitCracken [was deleted](https://github.com/github/dmca/blob/master/2017/2017-02-28-GitKraken.md) from GitHub. But the development continues (in private repo :smile:)! Send [me](https://vk.com/killwolfvlad) your changes. You can find link to the latest version in [releases](https://github.com/KillWolfVlad/GitKraken-Pro-AUR/releases).
