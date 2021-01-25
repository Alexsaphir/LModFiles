#!/bin/bash

name="make"
version=4.3
scratch=${HOME}/.scratch/
prefix="/opt/apps/${name}/${version}"

url="https://ftp.gnu.org/gnu/make/make-${version}.tar.gz"

cd "$scratch" || exit
wget $url
tar xzf "make-${version}.tar.gz"
rm "make-${version}.tar.gz"

cd "make-${version}" || exit
./configure --prefix=$prefix
make
#make check
sudo make install

cd "$scratch"
rm -rf "make-${version}"