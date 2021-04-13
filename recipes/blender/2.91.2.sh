#!/bin/bash

scratch=${HOME}/.scratch

version=2.91.2
version_major=2.91

prefix="/opt/apps/blender/${version}"

url="https://ftp.nluug.nl/pub/graphics/blender/release/Blender${version_major}/blender-${version}-linux64.tar.xz"

cd "$scratch" || exit
wget -N $url
tar -xf blender-${version}-linux64.tar.xz
cd blender-${version}-linux64 || exit

sudo mkdir -p $prefix
sudo mv * $prefix/
