# Gitkraken AUR Package

![Linting](https://github.com/Azd325/gitkraken/workflows/Linting/badge.svg)

## Update package

- Update package version in PKGBUILD
- Generate new checksums with `updpkgsums`
- Test install `makepkg -si`
- Update .SRCINFO `makepkg --printsrcinfo > .SRCINFO`
