#!/usr/bin/env bash

set -eo pipefail

mkdir -p /tmp/compile /tmp/build

if [[ "$DEBUGx" != "x" ]] ; then
  DEBUG="--debug"
fi

pkgr package . \
     --verbose $DEBUG \
     --disable-default-dependencies \
     --name envoy \
     --user envoy \
     --group envoy \
     --version "1.2.0-$ENVOY_SHA" \
     --compile-cache-dir=/tmp/compile \
     --buildpacks-cache-dir=/tmp/build \
     --buildpack=https://github.com/ph3nx/heroku-binary-buildpack.git
