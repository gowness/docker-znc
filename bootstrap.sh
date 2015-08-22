#! /usr/bin/env ash
set -e

apk update 
apk upgrade   
apk add autoconf automake gettext-dev g++ make openssl-dev pkgconfig zlib-dev git gdb

# Prepare building
mkdir -p /src

# Download, compile and install ZNC.
cd /src
git clone https://github.com/znc/znc.git --recursive
cd "znc"
./bootstrap.sh 
./configure && make && make install


#clean up 
apk del  autoconf automake g++ make pkgconfig 
rm  -rf /src/znc /var/cache/apk/*
