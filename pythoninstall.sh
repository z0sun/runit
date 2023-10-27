#!/bin/bash

# Update packages
sudo apt update -y

# Install Python
sudo apt install -y software-properties-common
sudo software-properties-common, add-apt-repository -y ppa:deadsnakes/ppa, python3.7, python3.7-venv, build-essential, libmysqlclient-dev, python3.7-dev
sudo apt update -y
sudo apt install -y python3.7 python3.7-venv

# Install Python3 pip
sudo apt install python3-pip -y
