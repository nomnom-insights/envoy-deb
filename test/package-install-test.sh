#!/usr/bin/env bash

set -oe pipefail

cp -v ./envoy/configs/google_com_proxy.json ./test/

docker run -t -i \
       -v $(pwd):/src \
       tutum/curl:latest  \
       /bin/bash -c "cd /src && bash ./test/verify.sh"
