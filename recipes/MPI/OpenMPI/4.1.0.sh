#!/bin/bash

module load local
module load gcc/10.2.0

scratch=${HOME}/.scratch

version=4.1.0
version_short=4.1
prefix="/opt/apps/MPI/OpenMPI/gcc-10.2.0/${version}"

url="https://download.open-mpi.org/release/open-mpi/v${version_short}/openmpi-${version}.tar.gz"

cd "$scratch" || exit
wget -nc $url
tar xzf "openmpi-${version}.tar.gz"

cd openmpi-${version} || exit

./configure --prefix=$prefix