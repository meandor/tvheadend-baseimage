FROM ubuntu:xenial
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y && \
    apt-get install -y apt-transport-https udev tar && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61 && \
    echo deb https://dl.bintray.com/tvheadend/ubuntu stable main | tee -a /etc/apt/sources.list && \
    apt-get update && apt-get install -y tvheadend && \
    apt-get autoclean
RUN mkdir -p /config && chown -R hts:hts /config
RUN usermod -a -G video hts
USER hts
CMD ["tvheadend", "-c", "/config", "-B", "-C"]
