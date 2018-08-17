FROM debian:stretch
LABEL maintainer="Vincent FRICOU <vincent@fricouv.eu>"

ENV \
  INV_GPGHASH=810273C4 \
  INV_GPGSRV=keys.gnupg.net \
  DEBIAN_FRONTEND=noninteractive \
  DEBIAN_RELEASE=stretch \
  INV_REPO=http://packages.inverse.ca/SOGo/nightly/4/debian/

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install apt-transport-https && \
  echo "deb ${INV_REPO} ${DEBIAN_RELEASE} ${DEBIAN_RELEASE}" > /etc/apt/sources.list.d/inverse.list && \
  apt-get update && \
  apt-get -y install sogo