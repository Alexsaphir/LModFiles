#!/bin/bash

module load local
module load gcc/10.2.0
module load python

scratch=${HOME}/.scratch

version=1.75.0
version_=1_75_0
prefix="/opt/apps/boost/gcc-10.2.0/${version}"

url="https://dl.bintray.com/boostorg/release/${version}/source/boost_${version_}.zip"

cd "$scratch" || exit
wget -nc $url

unzip boost_${version_}.zip
rm boost_${version_}.zip
cd boost_${version_} || exit

./bootstrap.sh --prefix=$prefix --with-python-root='/opt/apps/python/3.9.1/'