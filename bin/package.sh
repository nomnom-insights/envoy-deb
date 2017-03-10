#!/usr/bin/env bash

set -eo pipefail

versionStr="1.2.0"

mkdir -p /tmp/compile /tmp/build 
bundle exec  pkgr package . \
       --env ENVOY \
       --user=envoy \
       --group=envoy \
       --runner=upstart-1.5 \
       --version="$versionStr" \
       --buildpack=https://github.com/ph3nx/heroku-binary-buildpack \
       --compile-cache-dir=/tmp/compile \
       --buildpacks-cache-dir=/tmp/build
