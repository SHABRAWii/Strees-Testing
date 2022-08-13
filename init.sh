#!/bin/bash

sudo apt install -y default-jdk
sudo apt install -y default-jre
sudo apt install -y python python3
pip install pyinstaller
sudo apt install -y build-essential
sudo apt install -y g++
[ ! -f Generator/Generator.in ] && { touch Generator/Generator.in;true;}
# sed -i -e 's/\r$//' 