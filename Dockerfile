# Linux OpenJDK8 Dockerfile
FROM debian:jessie-backports
MAINTAINER <easye@not.org>

USER root

# A highly subjective set of "developer" oriented packages that are
# not strictly necessary to get "only" a jdk
RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update  && \
    apt-get upgrade -y && \
    apt-get install -y \
      screen \
      git mercurial python-dulwich \
      wget rsync \
      net-tools coreutils \
      make gcc binutils \
      emacs xauth \
      locales

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen \
  && update-locale LANG=en_US.UTF-8
ENV LANG "en_US.UTF-8" 

ENV var_local /var/local/
RUN mkdir -p ${var_local}
WORKDIR ${var_local}

RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get install -y  -t jessie-backports openjdk-8-jdk ant maven

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Now remove Java7
RUN apt-get remove -y openjdk-7-jre openjdk-7-jre-headless

# A minimal var for development work
VOLUME [ "${var_local}" ]

USER root
RUN useradd -ms /bin/bash java

USER java
RUN echo "JAVA_HOME=${JAVA_HOME}" >> /home/java/jdk8-env.sh

USER root

CMD ["/bin/bash", "-c", "while true; do date; sleep 1; done"]
