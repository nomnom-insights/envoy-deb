#!/usr/bin/env bash

set -oe pipefail


dpkg -i envoy.deb

envoy config:set ENVOY_CONFIG_PATH=/src/envoy/configs/google_com_proxy.json
envoy config:set ENVOY_LOG_LEVEL=debug
envoy config:set ENVOY_SERVICE_CLUSTER=test
envoy config:set ENVOY_SERVICE_NODE=node-1
envoy scale web=1
service envoy restart


envoy logs || bash
