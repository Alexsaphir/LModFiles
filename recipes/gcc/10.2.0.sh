#!/bin/bash

# https://github.com/OSGConnect/modulefiles/blob/master/recipes/gcc-6.2.0

gcc_version=10.2.0

scratch=${HOME}/.scratch
install_dir="/opt/apps/gcc/${gcc_version}"

gcc_url="ftp://ftp.gnu.org/gnu/gcc/gcc-${gcc_version}/gcc-${gcc_version}.tar.gz"

cd $scratch || exit

wget -nc "${gcc_url}"

tar xzf "gcc-${gcc_version}.tar.gz"

cd "gcc-${gcc_version}" || exit

./contrib/download_prerequisites --isl

mkdir objdir
cd objdir

# Architecture we are building for.
arch_flags="-march=x86-64"

export CC=gcc
export CXX=g++

OPT_FLAGS="-O3 -Wall  $arch_flags"
export CC="$CC"
export CXX="$CXX"
export CFLAGS="$OPT_FLAGS"
export CXXFLAGS="$(echo " $OPT_FLAGS " | sed 's/ -Wall / /g')"


../configure --prefix=${install_dir} \
  --disable-multilib \
  --enable-bootstrap \
  --enable-shared \
  --enable-threads=posix \
  --enable-checking=release \
  --with-system-zlib \
  --enable-__cxa_atexit \
  --enable-nls \
  --disable-libunwind-exceptions \
  --enable-linker-build-id \
  --enable-languages=c,c++,lto,go,fortran \
  --disable-vtable-verify \
  --with-default-libstdcxx-abi=new \
  --enable-libstdcxx-debug \
  --without-included-gettext \
  --enable-plugin \
  --disable-initfini-array \
  --disable-libgcj \
  --enable-plugin \
  --with-tune=native

make_flags="-j 10"
#
cd "$build_dir" || exit
make BOOT_CFLAGS="$OPT_FLAGS" ${make_flags} bootstrap
#sudo make install
