# GitKraken for AUR

`$ makepkg -si`

Optional: If you want rebuild GitKraken specially for your platform, uncomment `#_electron=1.2.3` in *PKGBUILD*

## Update package

- Update package version in *PKGBUILD*
- Update electron version in *PKGBUILD*
- Generate new checksums `$ updpkgsums`
- Test install `$ makepkg -si`
- Update *.SRCINFO* `$ makepkg --printsrcinfo > .SRCINFO`
