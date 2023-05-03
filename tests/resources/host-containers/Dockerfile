FROM ubuntu:22.04

ARG AS9_ROUTER_IPv4
ARG AS9_ROUTER_IPv6

RUN apt-get update && apt-get -y install iproute2 net-tools iputils-ping mtr-tiny nmap

CMD echo "Switching to ipv4 router ${AS9_ROUTER_IPv4}" ; \
    route -4n ; \
    ip -4 route change default via ${AS9_ROUTER_IPv4} dev eth0 ; \
    echo "Switching to ipv6 router ${AS9_ROUTER_IPv6}" ; \
    route -6n ; \
    ip -6 route del default via 2480:db8:1:9::1 ; \
    ip -6 route add default via ${AS9_ROUTER_IPv6} dev eth0 metric 1024 ; \
    sleep infinity
