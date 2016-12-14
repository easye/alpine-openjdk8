# necessary for macOS
DOCKER=/usr/local/bin/docker
#DOCKER	:= $(shell which docker)
#DOCKER = docker

APG = apg
#APG	:= $(shell which apg)

id="easye/openjdk8"

.PHONY: start
start: generate-secret
	bash -c ./docker-start-openjdk8.bash

.PHONY: all 
all: generate-secret start

.PHONY: build
build:
	$(DOCKER) build -t $(id) .

SEED=s3cr3t

.PHONY: generate-secret
generate-secret: http-api-secret
	echo "Regenerating <file:http-api-secret>."

# Assuming bash
http-api-secret:
	$(APG) -c ${SEED} | head -1 > http-api-secret

.PHONE:
clean:
	$(DOCKER) rm openjdk8
