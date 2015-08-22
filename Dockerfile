FROM        alpine
MAINTAINER  gowness "biga05@gmail.com"

RUN apk update && apk upgrade && apk add autoconf automake gettext-dev g++ make openssl-dev pkgconfig zlib-dev git gdb


ADD         bootstrap.sh /tmp/
RUN         chmod +x /tmp/bootstrap.sh && /tmp/bootstrap.sh

RUN         adduser -D znc
ADD         start-znc /usr/local/bin/
ADD         znc.conf.default /src/
RUN         chmod 644 /src/znc.conf.default

EXPOSE      6667
ENTRYPOINT  ["/usr/local/bin/start-znc"]
CMD         [""]
