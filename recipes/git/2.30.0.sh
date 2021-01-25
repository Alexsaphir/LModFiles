#!/bin/bash

# Build and install git 2.30.0
# Following https://github.com/git/git/blob/master/INSTALL

version='2.30.0'
prefix="/opt/apps/git/${version}"

# Preq
./perl5-5.32.0.sh

sudo apt-get install libssl-dev gettext libcurl4-gnutls-dev

wget -O "v${version}.zip" "https://github.com/git/git/archive/v${version}.zip"
unzip "v${version}.zip"

cd "git-${version}" || exit

make prefix=$prefix profile
sudo make prefix=$prefix PROFILE=BUILD install