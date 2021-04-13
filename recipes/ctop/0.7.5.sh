#!/bin/bash
scratch=${HOME}/.scratch

version=0.7.5
prefix="/opt/apps/ctop/${version}"

url="https://github.com/bcicen/ctop/"

module load local make gcc

cd "$scratch" || exit

git clone $url
cd ctop || exit
