[![gitkraken logo](https://cdn.rawgit.com/KillWolfVlad/GitKraken-Pro-AUR/1f92490bcec748ea5986f4ea7b366f1d95628818/logo.svg)](https://www.gitkraken.com/)

[![forthebadge](https://forthebadge.com/images/badges/uses-git.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-js.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-html.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-css.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/built-by-codebabes.svg)](https://forthebadge.com)

## How I can help update package?

1. Download latest `*.deb` package and add new dependencies in `PKGBUILD/depends`
2. Update package version in `PKGBUILD/pkgver`
3. Update package release in `PKGBUILD/pkgrel`
4. Update GitCracken version in `PKGBUILD/gitcrackenver`
5. Update Electron version in `PKGBUILD/electronver`
6. Update NodeGit version in `PKGBUILD/nodegitver`
7. Generate new checksums

```bash
updpkgsums
```

8. Update `.SRCINFO`

```bash
makepkg --printsrcinfo > .SRCINFO
```

9. Try build and install package

```bash
makepkg -ifs
```

## How I can help with GitCracken aka Patcher?

GitCracken [was deleted](https://github.com/github/dmca/blob/master/2017/2017-02-28-GitKraken.md) from GitHub. But the development continues (in private repo :smile:)! Send [me](https://vk.com/killwolfvlad) your changes. You can find link to the latest version in [releases](https://github.com/KillWolfVlad/GitKraken-Pro-AUR/releases).
