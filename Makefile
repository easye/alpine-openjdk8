# necessary for macOS
DOCKER=/usr/local/bin/docker
#DOCKER	:= $(shell which docker)
#DOCKER = docker

APG = apg
#APG	:= $(shell which apg)

.PHONY: start
start: all
	$(DOCKER) rm openjdk8
	bash -c ./docker-start-openjdk8.bash

.PHONY: all 
all: generate-secret
	$(DOCKER) build -t easye/alpine-openjdk8 .

SEED=s3cr3t

.PHONY: generate-secret
generate-secret: http-api-secret
	echo "Regenerating <file:http-api-secret>."

# Assuming bash
http-api-secret:
	$(APG) -c ${SEED} | head -1 > http-api-secret
