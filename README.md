# Gitkraken AUR Package

![Linting](https://github.com/Azd325/gitkraken/workflows/Linting/badge.svg)

## Update package

- change to the `gitkraken` folder
- Update package version in PKGBUILD
- Generate new checksums with `updpkgsums`
- Test install `makepkg -si`
- Update .SRCINFO `makepkg --printsrcinfo > .SRCINFO`

## GitKraken Information

The legendary Git GUI client for Windows, Mac & Linux built on [electron](https://electron.io), [libgit2](https://libgit2.org/), [NodeGit](https://www.nodegit.org/) and [monaco editor](https://microsoft.github.io/monaco-editor/).

[Submit feature requests](https://feedback.gitkraken.com/)
