FROM ubuntu:bionic
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y
RUN apt-get install -y apt-utils gnupg udev tar coreutils wget apt-transport-https lsb-release ca-certificates && \
    wget -qO key.gpg https://doozer.io/keys/tvheadend/tvheadend/pgp && apt-key add key.gpg && \
    echo "deb https://apt.tvheadend.org/stable $(lsb_release -sc) main" > /etc/apt/sources.list.d/tvheadend.list && \
    apt-get update && apt-get install -y tvheadend && \
    apt-get autoclean
RUN mkdir -p /config && chown -R hts:hts /config
RUN usermod -a -G video hts
USER hts
CMD ["tvheadend", "-c", "/config", "-B", "-C"]
