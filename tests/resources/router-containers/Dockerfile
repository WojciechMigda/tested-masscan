FROM ubuntu:22.04

ENV BIRD_DIR=/run/bird
ENV RADVD_DIR=/run/radvd

RUN \
    apt-get update && \
    apt-get -y install bird radvd iproute2 net-tools iputils-ping && \
    apt-get clean

RUN mkdir -p ${BIRD_DIR} && mkdir -p ${RADVD_DIR}

COPY bootstrap.sh /

ENTRYPOINT ["/bootstrap.sh"]
