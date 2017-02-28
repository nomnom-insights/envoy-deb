#!/usr/bin/env bash

set -eo pipefail

ENVOY_ROOT=./envoy

if [[ -e ./envoy ]] ; then
  cd $ENVOY_ROOT
  git pull -r
  cd ..
else
  git clone git@github.com:lyft/envoy.git
fi

docker pull lyft/envoy-build:latest

docker run -t -i \
       -u root:root \
       -v $ENVOY_ROOT:/source \
       lyft/envoy-build:latest /bin/bash -c "cd /source && ci/do_ci.sh server_only"

mkdir -p ./bin
cp ./envoy/build/source/exe/envoy ./bin/envoy