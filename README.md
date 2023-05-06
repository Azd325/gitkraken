# Gitkraken AUR Package

![Linting](https://github.com/Azd325/gitkraken/workflows/Linting/badge.svg)
![Gitkraken AUR Version](https://img.shields.io/aur/version/gitkraken)
![Gitkraken AUR Votes](https://img.shields.io/aur/votes/gitkraken)

## Gitkraken

This package provides only a way to install Gitkraken on Arch Linux.

You can receive help with Gitkraken, through the [Help Center](https://help.gitkraken.com/).

You can also submit [feature requests](https://feedback.gitkraken.com/) and see upcoming features on the [roadmap](https://www.gitkraken.com/git-client/roadmap).

## Contributing

### Update package

- Change to the [gitkraken-aur](gitkraken-aur) folder
- Update package version in [PKGBUILD](gitkraken-aur/PKGBUILD)
- Update checksums with `updpkgsums`
- Do a test installation with `makepkg --syncdeps --install` [Docs for makepkg](https://wiki.archlinux.org/title/makepkg)
- Update [.SRCINFO](gitkraken-aur/.SRCINFO) with `makepkg --printsrcinfo > .SRCINFO` [Docs for makepkg](https://wiki.archlinux.org/title/makepkg)
