#!/bin/bash

scratch=${HOME}/.scratch

ml local
ml binutils
ml gcc
ml make


version=2.35.1
prefix="/opt/apps/binutils/${version}"

url="https://ftp.gnu.org/gnu/binutils/binutils-${version}.tar.gz"

cd "$scratch" || exit
mkdir binutils && cd binutils

wget -N $url
tar -xzf "binutils-${version}.tar.gz"


../binutils-${version}/configure --prefix=$prefix
make -j 8
sudo make install

