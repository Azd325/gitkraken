[![gitkraken logo](https://cdn.rawgit.com/KillWolfVlad/GitKraken-Pro-AUR/1f92490bcec748ea5986f4ea7b366f1d95628818/logo.svg)](https://www.gitkraken.com/)

# Update package

* Update package version in PKGBUILD
* Generate new checksums with

```$ updpkgsums```

* Test install

```$ makepkg -si```

* Update .SRCINFO

```$ makepkg --printsrcinfo > .SRCINFO```
