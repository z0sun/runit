#!/bin/bash

#First update and upgrade the system
sudo apt update
sudo apt upgrade -y

#enter the wait command to finish the update
wait
echo "System updated and upgraded"
sleep 10

# Download Java runtime environment 
sudo apt-get install -y fontconfig openjdk-17-jre

#enter wait command finish the install
wait
echo "Java installed"
sleep 10

#This is the Debian package repository of Jenkins to automate installation and upgrade.
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \/usr/share/keyrings/jenkins-keyring.asc > /dev/null

#Then add a Jenkins apt repository entry
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \https://pkg.jenkins.io/debian binary/ | sudo tee \/etc/apt/sources.list.d/jenkins.list > /dev/null

#run the update command again  How do I check for the Jenkins package? check to see if this file exists (/etc/apt/sources.list.d/jenkins.list content in file)
sudo apt update

#enter the wait command to finish the update
wait

#install Jenkins
sudo apt install -y jenkins
echo "JENKINS INSTALLED"
sleep 5

#install python3.10-venv
sudo apt install -y python3.10-venv
echo "PHTHON3.10-VENV INSTALLED"
sleep 5

#install python3-pip
sudo apt install -y python3-pip
echo "PYTHON3-PIP INSTALLED"
sleep 5

#install unzip
sudo apt install -y unzip
echo "UNZIP INSTALLED"
sleep 5

#install nginx
sudo apt install -y nginx
echo "NGINX INSTALLED"
sleep 5

#enter wait command finish the install
wait

#run command to check the status of Jenkins How do I check if it is running? looking for [Active: active (running)]. What should I do if it's not?
#systemctl status jenkins

#exit out of systemctl
#q

#Put code into another file to be read
sudo cat /var/lib/jenkins/secrets/initialAdminPassword > pw.txt

#copy password
