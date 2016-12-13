# Linux OpenJDK8 Dockerfile
FROM debian:latest
MAINTAINER <easye@not.org>

USER root

RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update  && \
    apt-get upgrade -y && \
    apt-get install -y \
      screen \
      git mercurial python-dulwich \
      wget rsync \
      net-tools coreutils \
      make gcc binutils \
      emacs xauth

ENV var /var/local/
RUN mkdir -p ${var}
WORKDIR ${var}

RUN echo "deb http://httpredir.debian.org/debian jessie-backports main contrib non-free" >> /etc/apt/sources.list && apt-get update

RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get install -y openjdk-8-jdk ant 

#ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

# A minimal var for development work

VOLUME [ "${var}" ]

CMD ["/bin/bash -c while true; do sleep 1; done"]

