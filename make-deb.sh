#!/usr/bin/env bash

set -eo pipefail

docker build -t envoy-package .

volPath=$(readlink -f ./build)

docker run -t -i  \
       -u root:root \
       -v $volPath:/deb-tmp \
       envoy-package /bin/bash -c "cd /deb-tmp && bash package.sh"
