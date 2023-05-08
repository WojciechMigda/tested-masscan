#!/bin/bash

set -u

echo "Switching to ipv4 router ${AS9_ROUTER_IPv4}"
route -4n
ip -4 route change default via ${AS9_ROUTER_IPv4} dev eth0

echo "Switching to ipv6 router ${AS9_ROUTER_IPv6}"
route -6n
ip -6 route del default via 2480:db8:1:9::1 || true
ip -6 route add default via ${AS9_ROUTER_IPv6} dev eth0 metric 1024

netcat -vkl 22 & \
netcat -vkl 135 & \
netcat -vkl 137 & \
netcat -vkl 1433 & \
netcat -vkl 1521 & \
netcat -vkl 3389 & \
netcat -vkl 5985 & \
netcat -6vkl 22 & \
netcat -6vkl 135 & \
netcat -6vkl 137 & \
netcat -6vkl 1433 & \
netcat -6vkl 1521 & \
netcat -6vkl 3389 & \
netcat -6vkl 5985 & \
sleep infinity
