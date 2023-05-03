#!/bin/bash

set -u

ip route del default

bird6 -d -c /etc/bird/bird-ipv6.custom.conf & \
bird -d -c /etc/bird/bird-ipv4.custom.conf & \
radvd -d 2 --nodaemon -C /etc/radvd/radvd.custom.conf
