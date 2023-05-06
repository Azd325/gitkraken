# Gitkraken AUR Package

![Linting](https://github.com/Azd325/gitkraken/workflows/Linting/badge.svg)

## Update package

- change to the [gitkraken-aur](gitkraken-aur) folder
- Update package version in [PKGBUILD](gitkraken-aur/PKGBUILD)
- Update checksums with `updpkgsums`
- Do a test install with `makepkg --syncdeps --install` [Docs for makepkg](https://wiki.archlinux.org/title/makepkg)
- Update [.SRCINFO](gitkraken-aur/.SRCINFO) with `makepkg --printsrcinfo > .SRCINFO` [Docs for makepkg](https://wiki.archlinux.org/title/makepkg)

## GitKraken Information

[GitKraken](https://gitkraken.com), the legendary Git GUI client for Windows, Mac & Linux built on [electron](https://www.electronjs.org/), [libgit2](https://libgit2.org/), [NodeGit](https://www.nodegit.org/) and [monaco editor](https://microsoft.github.io/monaco-editor/).

[Submit feature requests](https://feedback.gitkraken.com/)
