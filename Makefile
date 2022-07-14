pull:
	git subtree split -P gitkraken-aur --rejoin
	git subtree pull -P gitkraken-aur "aur@aur.archlinux.org:gitkraken.git" master -m "Merge subbtree gitkraken"

push:
	git subtree push -P gitkraken-aur "aur@aur.archlinux.org:gitkraken.git" master
