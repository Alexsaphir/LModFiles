#!/bin/bash

sudo apt install -y gdebi wget

wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"

sudo gdebi -n /tmp/discord.deb

rm /tmp/discord.deb
sudo apt remove gdebi