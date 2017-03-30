#!/usr/bin/env bash

set -oe pipefail


dpkg -i envoy.deb

echo 'export ENVOY_CONFIG_PATH=/src/envoy/configs/google_com_proxy.json' > /etc/default/envoy
echo 'export ENVOY_LOG_LEVEL=debug' >> /etc/default/envoy
echo 'export ENVOY_SERVICE_CLUSTER=test' >> /etc/default/envoy
echo 'export ENVOY_SERVICE_NODE=node-1' >> /etc/default/envoy
echo 'export ENVOY_LOG_FILE=/var/log/envoy.log' >> /etc/default/envoy
echo  'ulimit -n 32000' >> /etc/default/envoy


bash

service envoy restart


tail -f /var/log/envoy.log
