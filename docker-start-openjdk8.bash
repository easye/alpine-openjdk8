#!/usr/bin/env bash
DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Name of docker container to run as (should only be one per Docker
# Engine instance)
name=openjdk8

DOCKER="$(which docker)"
#DOCKER=/usr/local/bin/docker

if [[ -z $1 ]]; then
    image=easye/openjdk8:latest
else
    image=$1
fi

host_d=$(pwd)/var
var_d=/var/tmp/easye/openjdk8

mkdir -p ${var_d}

options="$options --publish 12712:12712"
#options="$options --volume=${host_d}:${var_d}"

$DOCKER run --detach --name $name $options $image
