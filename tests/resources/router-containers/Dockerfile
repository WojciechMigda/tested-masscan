FROM ubuntu:22.04

ENV BIRD_DIR=/run/bird
ENV RADVD_DIR=/run/radvd

RUN apt-get update && apt-get -y install bird radvd iproute2 net-tools iputils-ping

RUN mkdir -p ${BIRD_DIR} && mkdir -p ${RADVD_DIR}

CMD ip route del default ; bird6 -d -c /etc/bird/bird-ipv6.custom.conf & bird -d -c /etc/bird/bird-ipv4.custom.conf & radvd -d 2 --nodaemon -C /etc/radvd/radvd.custom.conf
