#!/usr/bin/env bash

set -eo pipefail

docker build -t envoy-package .

volPath=$PWD

if [[ "$(uname) =  "Linux" ]] ; then
 usr="$USER:$USER
else
 usr="root:root"
fi

docker run -t -i  \
       -u $usr \
       -v $volPath:/deb-tmp \
       envoy-package /bin/bash -c "cd /deb-tmp && bash package.sh"
