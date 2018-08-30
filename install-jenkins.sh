#!/bin/bash

#java env
java -version
if [ $?!=0 ]; then
	sudo add-apt-repository -y ppa:webupd8team/java
	sudo apt-get -y update
fi

#download and add source
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins

#launch
sudo docker ps > /dev/null
if [ $?==0 ]; then
	sudo gpasswd -a ${USER} docker
	cat /etc/group | grep ^docker
	sudo service docker restart 
fi

sudo service jenkins start
sudo service jenkins status
