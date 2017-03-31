#!/usr/bin/env bash

set -oe pipefail

apt-get remove -y envoy
dpkg -i /vagrant/envoy.deb

echo 'export ENVOY_CONFIG_PATH="/vagrant/envoy/configs/google_com_proxy.json"' > /etc/default/envoy
echo 'export ENVOY_LOG_LEVEL="debug"' >> /etc/default/envoy
echo 'export ENVOY_SERVICE_CLUSTER="test"' >> /etc/default/envoy
echo 'export ENVOY_SERVICE_NODE="node-1"' >> /etc/default/envoy
echo 'export ENVOY_LOG_FILE="/var/log/envoy.log"' >> /etc/default/envoy

service envoy restart

cat /var/log/envoy/*.log

sleep 5

curl -f localhost:10000
