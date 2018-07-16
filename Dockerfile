FROM debian:jessie

LABEL maintainer="matt@cactuar.net"
LABEL version="0.1"

RUN apt-get update && apt-get -y install \
	less \
	vim \
	srecord \
	unzip \
	wget \
	gcc \
	make &&\
	mkdir /build && cd /build && wget https://github.com/cc65/cc65/archive/master.zip -O master.zip && unzip master.zip && rm -f master.zip &&\
	cd /build/cc65-master &&\
	export PREFIX=/opt/cc65 &&\
	make &&\
	make install &&\
	cd / &&\
	rm -rf /build &&\
	apt-get -y purge unzip wget gcc && apt-get -y autoremove --purge

ENV PATH /opt/cc65/bin:$PATH

