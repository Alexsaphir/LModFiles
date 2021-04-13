#!/bin/bash
# https://github.com/Syllo/nvtop/tree/1.1.0#nvtop-build

scratch=${HOME}/.scratch

version=1.1.0
prefix="/opt/apps/nvtop/${version}"

module load local cmake git

cd "$scratch" || exit
# git clone https://github.com/Syllo/nvtop.git
# Ligne 64 : set(CMAKE_INSTALL_RPATH_USE_LINK_PATH FALSE)
# Ligne 87 :   DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1/"

mkdir -p nvtop/build && cd "nvtop/build" || exit

cmake .. -DNVML_RETRIEVE_HEADER_ONLINE=True -DCMAKE_INSTALL_PREFIX=$prefix
make
sudo make install