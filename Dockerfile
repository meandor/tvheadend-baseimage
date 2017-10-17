FROM ubuntu:xenial
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y apt-transport-https udev && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61 && \
    echo deb https://dl.bintray.com/tvheadend/ubuntu stable main | tee -a /etc/apt/sources.list && \
    apt-get update && apt-get install -y tvheadend
