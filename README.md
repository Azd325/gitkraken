[![gitkraken logo](https://cdn.rawgit.com/KillWolfVlad/GitKraken-Pro-AUR/1f92490bcec748ea5986f4ea7b366f1d95628818/logo.svg)](https://www.gitkraken.com/)

[![forthebadge](https://forthebadge.com/images/badges/uses-git.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-js.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-html.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-css.svg)](https://forthebadge.com) [![forthebadge](http://forthebadge.com/images/badges/built-by-codebabes.svg)](http://forthebadge.com)

# Update package

* Update package version in PKGBUILD
* Generate new checksums with

```$ updpkgsums```

* Test install

```$ makepkg -si```

* Update .SRCINFO

```$ makepkg --printsrcinfo > .SRCINFO```
