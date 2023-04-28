FROM debian:buster

ENV BIRD_DIR=/run/bird

RUN apt-get update && apt-get -y install bird iproute2 net-tools iputils-ping

RUN mkdir -p ${BIRD_DIR}

ENTRYPOINT ["/usr/sbin/bird"]

CMD ["-h"]
