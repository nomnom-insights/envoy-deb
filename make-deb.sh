#!/usr/bin/env bash

set -eo pipefail

docker build -t envoy-package .

mkdir -p ./out
docker run -t -i -u root:root \
       -v out:/build \
       envoy-package /bin/bash -c "cd /build && package.sh"
