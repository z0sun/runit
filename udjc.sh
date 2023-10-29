#!/bin/bash

sudo apt update 
sudo apt upgrade 

#Download the Jenkins, Python & AWS installation scripts
curl -O https://raw.githubusercontent.com/z0sun/runit/main/jenkins.sh
curl -O https://raw.githubusercontent.com/z0sun/runit/main/pythoninstall.sh
curl -O https://raw.githubusercontent.com/z0sun/runit/main/awscli.sh

#Make the scripts executable
chmod +x jenkins.sh
chmod +x pythoninstall.sh
chmod +x awscli.sh

#Run the Jenkins, Python & AWS installation scripts
./jenkins.sh
./pythoninstall.sh
./awscli.sh

sudo apt install build-essential libmysqlclient-dev
