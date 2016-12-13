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

RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get install openjdk8

#ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

# A minimal var for development work

ENV var /var/local/
RUN mkdir -p ${var}
WORKDIR ${var}

VOLUME [ "${var}" ]

CMD ["bash"]

