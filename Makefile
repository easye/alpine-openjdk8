# necessary for macOS
#DOCKER=/usr/local/bin/docker
#DOCKER	:= $(shell which docker)
DOCKER = docker

id="easye/openjdk8"

.PHONY: all 
all: build

.PHONY: start
start: 
	bash -c ./docker-start-openjdk8.bash

.PHONY: build
build:
	$(DOCKER) build -t $(id) .

.PHONY:
clean:
	$(DOCKER) rm openjdk8
