#!/usr/bin/env bash

set -eo pipefail

mkdir -p /tmp/compile /tmp/build 

pkgr package . \
--debug \
       --env production \
       --user=envoy \
       --group=envoy \
       --env "BUILD=1" \
       --runner=upstart-1.5 \
       --version 1.2.0 \
       --buildpack=https://github.com/ph3nx/heroku-binary-buildpack.git \
       --compile-cache-dir=/tmp/compile \
       --buildpacks-cache-dir=/tmp/build
