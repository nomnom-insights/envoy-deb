#!/usr/bin/env bash

set -eo pipefail

here=$PWD
ENVOY_ROOT=$PWD/envoy

if [[ -e ./envoy ]] ; then
  cd $ENVOY_ROOT
  git pull -r
  cd $here
else
  git clone git@github.com:lyft/envoy.git
fi

docker pull lyft/envoy-build:latest

docker run -t -i \
       -u root:root \
       -v $ENVOY_ROOT:/source \
       lyft/envoy-build:latest /bin/bash -c "cd /source && ci/do_ci.sh server_only"

mkdir -p ./bin
cp $(find . -type -f -name envoy) ./bin/envoy