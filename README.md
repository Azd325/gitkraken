# GitKraken for AUR

Rebuild GitKraken specially for your platform

- Required disk space for build: ~1.5 GB
- Build time: ~10 min

Works on Arch Linux & Manjaro!

## Update package

- Update package version in *PKGBUILD*
- Update electron version in *PKGBUILD*
- Generate new checksums `$ updpkgsums`
- Test install `$ makepkg -si`
- Update *.SRCINFO* `$ makepkg --printsrcinfo > .SRCINFO`
