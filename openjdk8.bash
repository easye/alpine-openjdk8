#!/usr/bin/env bash
DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log_d=$HOME/var/log; mkdir -p $log_d

var_d=$HOME/work/easye/var/openjdk8

if [[ ! -f $DIR/http-api-secret ]]; then
    echo No $DIR/http-api-secret present.  Please create one.
    exit 1
fi

java $*


