FROM polinux/snmpd

ARG AS7_ROUTER_IPv4
ARG AS7_ROUTER_IPv6
ARG AS9_ROUTER_IPv4
ARG AS9_ROUTER_IPv6

RUN \
    yum install -y iproute net-tools iputils mtr && \
    yum clean all

COPY wrapped-bootstrap.sh /

ENTRYPOINT ["/wrapped-bootstrap.sh"]
