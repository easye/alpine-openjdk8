#!/usr/bin/env bash
DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log_d=$HOME/var/log; mkdir -p $log_d

var_d=$HOME/work/easye/var/openjdk8

if [[ ! -f $DIR/http-api-secret ]]; then
    echo No $DIR/http-api-secret present.  Please create one.
    exit 1

fi

cmd=$GOPATH/bin/siad
echo Backgrounding $cmd with data in ${var_sia_d} logging to ${log_d}


nohup $cmd \
      --sia-directory ${var_sia_d} \
      2>&1 \
             >> $log_d/siad.out  \
    &                     

# nohup $cmd \
#     --sia-directory ${var_sia_d} \
#     --authenticate-api \
#   >> $log_d/siad.out 2>&1 \
#    < $DIR/http-api-secret &                     


