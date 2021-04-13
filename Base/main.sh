#!/bin/bash

sudo apt update
sudo apt dist-upgrade

sudo apt install htop screen nload iotop
sudo apt install ncdu mc nano
sudo apt install wget curl

# SSH key generation
ssh-keygen -t rsa -b 4096 -q -f "$HOME/.ssh/id_rsa" -N ""

# Ubuntu gnome extension
sudo apt-get install chrome-gnome-shell

# Nvidia Fan control
sudo nvidia-xconfig -a --cool-bits=28

# DNS entry
./Network/dns.sh

# Other software
./Database/sqlitebrowser.sh

./media/discord.sh
./media/spotify.sh

./latex.sh

# Cleaning
sudo apt autoremove
