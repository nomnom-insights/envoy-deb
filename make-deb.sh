#!/usr/bin/env bash

set -eo pipefail

docker build -t envoy-package .

volPath=$PWD/package-context


ENVOY_SHA=$(cd ./envoy && git rev-parse --short HEAD)

if [[ "$(uname)" =  "Linux" ]] ; then
 usr="$USER:$USER"
else
 usr="root:root"
fi

rm -f $volPath/*.deb

docker run -t -i  \
       -e"ENVOY_SHA=$ENVOY_SHA" \
       -u $usr \
       -v $volPath:/deb-tmp \
       envoy-package /bin/bash -c "cd /deb-tmp && bash package.sh"

mv package-context/*.deb ./envoy.deb
