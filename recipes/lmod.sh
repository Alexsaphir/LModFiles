#!/bin/bash

# We choose to install everything at /opt/apps/

# Fetch a version of lua  shared by lmod
wget https://sourceforge.net/projects/lmod/files/lua-5.1.4.9.tar.bz2
tar xf lua-5.1.4.9.tar.bz2
cd lua-5.1.4.9/

./configure --prefix=/opt/apps/lua/5.1.4.9
make
sudo make install

sudo ln -s /opt/apps/lua/5.1.4.9/ /opt/apps/lua/lua
ln -s /opt/apps/lua/lua/bin/lua /usr/local/bin/
sudo ln -s /opt/apps/lua/lua/bin/luac /usr/local/bin/

# Installation Lmod

wget "https://github.com/TACC/Lmod/archive/8.4.20.zip"
unzip 8.4.20.zip
cd Lmod-8.4.20/
#TCL
sudo apt install tcl8.6 tcl8.6-dev tcl-dev
./configure --prefix=/opt/apps
sudo make install

sudo mkdir /opt/apps/modulefiles

# Add script to profile and bashrc
sudo ln -s /opt/apps/lmod/lmod/init/profile        /etc/profile.d/z00_lmod.sh
sudo ln -s /opt/apps/lmod/lmod/init/cshrc          /etc/profile.d/z00_lmod.csh

echo "
if ! shopt -q login_shell; then
  if [ -d /etc/profile.d ]; then
    for i in /etc/profile.d/*.sh; do
      if [ -r $i ]; then
        . $i
      fi
    done
  fi
fi
" | sudo tee -a /etc/bash.bashrc

# Modulefiles

sudo mkdir /opt/apps/Linux
sudo mkdir /opt/apps/Core

# Make 5.4.1 the default version for gnuplot
sudo ln -s /opt/apps/modulefiles/Core/gnuplot/5.4.1.lua /opt/apps/modulefiles/Core/gnuplot/default
# Make 3.17.4 the feault version for CMake
sudo ln -s /opt/apps/modulefiles/Core/cmake/3.17.4.lua /opt/apps/modulefiles/Core/cmake/default