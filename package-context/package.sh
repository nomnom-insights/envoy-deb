#!/usr/bin/env bash

set -eo pipefail

mkdir -p /tmp/compile /tmp/build

version="1.2.0-$ENVOY_SHA"

fpm -s dir \
    -t deb \
    -n envoy \
    -v $version \
    ./bin/envoy=/usr/bin/envoy \
    ./envoy.conf=/etc/init/envoy.conf \
    ./defaults=/etc/default/envoy
