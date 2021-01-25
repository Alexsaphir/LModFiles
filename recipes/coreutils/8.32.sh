#!/bin/bash

scratch=${HOME}/.scratch

ml local
ml binutils
ml gcc
ml make

# https://ostechnix.com/advanced-copy-add-progress-bar-to-cp-and-mv-commands-in-linux/
# https://github.com/jarun/advcpmv

version=8.32
version_patch=0.8
prefix="/opt/apps/coreutils/${version}"

url="https://ftp.gnu.org/gnu/coreutils/coreutils-${version}.tar.gz"

cd "$scratch" || exit
mkdir coreutils
cd coreutils || exit

wget -N $url
tar -xzf "coreutils-${version}.tar.gz"

cd "coreutils-${version}" || exit

# Download patch
wget -N "https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-${version_patch}-${version}.patch"

patch -p1 -i advcpmv-${version_patch}-${version}.patch

mkdir objdir
cd objdir || exit

../configure --prefix=$prefix
make -j 8
sudo make install

