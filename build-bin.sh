#!/usr/bin/env bash

set -eo pipefail

buildVersion=${1:-master}

here=$(pwd)
ENVOY_ROOT=$PWD/envoy

if [[ -e ./envoy ]] ; then
  cd $ENVOY_ROOT
  git reset --hard
  git checkout master
  git fetch -a -p
  git pull -r
  cd $here
else
  git clone git@github.com:lyft/envoy.git
fi

cd $ENVOY_ROOT
echo "Building from $buildVersion"
git checkout $buildVersion
cd $here

docker pull lyft/envoy-build:latest

docker run -t -i \
       -u root:root \
       -v $ENVOY_ROOT:/source \
       lyft/envoy-build:latest /bin/bash -c "cd /source && ci/do_ci.sh server_only"

mkdir -p ./bin
cp $(find . -type -f -name envoy) ./bin/envoy
