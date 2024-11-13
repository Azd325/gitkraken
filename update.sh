#!/bin/bash

# Get new version info
VER=$(curl -s https://www.gitkraken.com/download | grep "Latest release:" | awk 'match($0,">Latest release: *(.*)</",a){print a[1]}')

pushd gitkraken-aur || exit

# Update PKGBUILD
sed -i "s/pkgver=.*$/pkgver=$VER/g" PKGBUILD

# Calc new hash
updpkgsums

# Build and install pkg
makepkg -si

# Update .SRCINFO
makepkg --printsrcinfo >.SRCINFO

# Git operations
git add .SRCINFO PKGBUILD
git commit -m "Update to $VER"

# Cleanup
rm -rf pkg/ src/ ./*.pkg.tar.zst ./*.tar.gz

popd || exit
printf "\nAll done!\n"
