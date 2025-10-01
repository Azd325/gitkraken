DOCKER_PLATFORM := linux/amd64
DOCKER_IMAGE := gitkraken-update
MOUNT_PATH := $(CURDIR)
DOCKER_RUN := docker run --platform=$(DOCKER_PLATFORM) --rm -v "$(MOUNT_PATH)":/work -w /work $(DOCKER_IMAGE)

.PHONY: pull push update-container update-container-pkgrel

pull:
	git subtree split -P gitkraken-aur --rejoin
	git subtree pull -P gitkraken-aur "aur@aur.archlinux.org:gitkraken.git" master -m "Merge subbtree gitkraken"

push:
	git subtree push -P gitkraken-aur "aur@aur.archlinux.org:gitkraken.git" master

update-container:
	docker build --platform=$(DOCKER_PLATFORM) -t $(DOCKER_IMAGE) .
	$(DOCKER_RUN) ./update.sh

update-container-pkgrel:
	docker build --platform=$(DOCKER_PLATFORM) -t $(DOCKER_IMAGE) .
	$(DOCKER_RUN) ./update.sh -p
