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

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# A minimal var for development work

VOLUME [ "${var}" ]

RUN useradd -ms /bin/bash java
USER java
RUN echo "JAVA_HOME=${JAVA_HOME}" >> /home/java/jd8-env.sh

CMD ["/bin/bash", "-c", "while true; do date; sleep 1; done"]

