FROM debian:10.9

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir /tmp/icecast-kh
COPY ./src/icecast-kh /tmp/icecast-kh

RUN set -eux 
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl
RUN apt-get install -y nano 
RUN apt-get install -y net-tools
RUN apt-get install -y iputils-ping 
RUN apt-get install -y build-essential 
RUN apt-get install -y g++
RUN apt-get install -y gcc
RUN apt-get install -y libshout-dev
RUN apt-get install -y libspeex-dev
RUN apt-get install -y libmp3lame-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libxslt1-dev
RUN apt-get install -y libvorbis-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libogg-dev
RUN apt-get install -y libflac-dev
RUN apt-get install -y libtheora-dev 
RUN apt-get install -y libssl-dev
RUN rm -rf /var/lib/apt/lists/*

RUN /tmp/icecast-kh/configure --with-curl --with-openssl
RUN make
RUN make install
RUN make clean
RUN rm -rf /tmp/icecast-kh

RUN rm -rf /usr/local/share/icecast
RUN rm /usr/local/etc/icecast.xml

RUN mkdir /var/log/icecast-kh
RUN touch /var/log/icecast-kh/access.log
RUN touch /var/log/icecast-kh/error.log
RUN touch /var/log/icecast-kh/daemon.log
RUN mkdir /etc/icecast-kh
RUN mkdir /var/icecast-kh

COPY ./src/icecast-ui /var/icecast-kh

RUN groupadd icecast 
RUN useradd -g icecast -d /etc/icecast-kh -c "IceCast Server" -m -s /sbin/nologin icecast
RUN chown icecast:icecast /var/icecast-kh -R 

COPY ./docker/icecast-kh/config.xml /etc/icecast-kh

USER icecast

CMD  ["icecast", "-c", "/etc/icecast-kh/config.xml"]