#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install build-essential 
sudo apt install -y default-jre
sudo apt-get install pkg-config
sudo apt install libmysqlclient-dev -y

curl -O https://raw.githubusercontent.com/z0sun/runit/main/pythoninstall.sh
chmod +x pythoninstall.sh
./python.sh
sudo apt install -y python3.7-dev

curl -O https://raw.githubusercontent.com/z0sun/runit/main/installterraform.sh
chmod +x installterraform.sh
./installterraform.sh
