#!/bin/bash

sudo apt-get update -y

# Install JDK
sudo apt install openjdk-8-jdk -y
sudo apt-get update -y

# Download Jenkins keys
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update -y

# Install & start Jenkins
sudo apt-get install -y fontconfig openjdk-17-jre jenkins
sudo systemctl start jenkins

# Start Jenkins
sudo systemctl start jenkins

# Install Python and Database
sudo apt update

sudo apt install -y software-properties-common

sudo add-apt-repository -y ppa:deadsnakes/ppa

sudo apt install -y python3.7

sudo apt install -y python3.7-venv

sudo apt install -y build-essential

sudo apt install -y libmysqlclient-dev

sudo apt install -y python3.7-dev

# Install Python3 pip
sudo apt install python3-pip -y

# # Get Jenkins unlock key
# echo "Jenkins Unlock Key:"
# sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Update packages
sudo apt update -y
#sudo apt install -y unzip
#sudo apt install -y nginx
#sudo cat /var/lib/jenkins/secrets/initialAdminPassword > pw.txt
#run command to check the status of Jenkins How do I check if it is running? looking for [Active: active (running)]. What should I do if it's not?
#systemctl status jenkins
