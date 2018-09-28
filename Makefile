SHELL := /bin/bash

VERSION := $(shell grep "LABEL version" Dockerfile | cut -d \" -f 2)
IMAGE_VERSION := vasa81/adminer:$(VERSION)

build:
	docker build --no-cache -t $(IMAGE_VERSION) .

run:
	$(eval IP:=$(shell ip route | grep docker0 | rev | cut -d ' ' -f 2 | rev))
	docker run -d --name adminer -p 5555:80 --add-host=dockerhost:${IP} ${IMAGE_VERSION}

run-macos:
	docker run -d --name adminer -p 5555:80 ${IMAGE_VERSION}

run-bash:
	$(eval IP:=$(shell ip route | grep docker0 | rev | cut -d ' ' -f 2 | rev))
	docker run -it --rm --name adminer -p 5555:80 --add-host=dockerhost:${IP} ${IMAGE_VERSION} bash
