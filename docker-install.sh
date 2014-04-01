#!/bin/bash
#
# Simple install script for docker on RHEL based distros

sudo yum -y install docker-io; sudo yum -y update docker-io && sudo service docker start

echo "Would you like docker to run at boot?"

echo "1. Yes"
echo "2. No"

read boot;

case $boot in

	1) sudo chkconfig docker on; echo "You are now entering your Fedora install via docker";; 
	2) echo "You are now entering your Fedora install via docker";;

esac

sudo docker run -i -t fedora /bin/bash
