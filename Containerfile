FROM ubuntu:latest

RUN apt-get update && \
		apt-get install -y python3 wget xdg-utils xz-utils libopengl0 libegl1 libnss3 libxcb-xinerama0 
RUN cd tmp && \
		wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin

ENV XDG_CONFIG_HOME=/config

ENTRYPOINT calibre-server --port=8788 --enable-auth --enable-local-write /books
EXPOSE 8788
VOLUME /config
