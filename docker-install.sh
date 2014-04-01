#!/bin/bash
#
# Script: docker-install
# Purpose: Simple install script for docker on RHEL based distros
# Author: Alan-Michael Barnes
#
# Install the epel repo, just in case it is not already installed.

echo -e "What version of RHEL are you currently running?\n"

echo    "1. 5.x"
echo -e "2. 6.x\n"

read rhel;

echo -e "\n"

case $rhel in

        1) wget http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm && wget http://rpms.famillecollet.com/enterprise/remi-release-5.rpm && sudo rpm -Uvh remi-release-5*.rpm epel-release-5*.rpm;;
        2) wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm && sudo rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm;;

esac

# Install docker-io and all dependencies.

sudo yum -y install docker-io; sudo yum -y update docker-io && sudo service docker start

# Confirm if docker should run at start up or not.

echo -e "Would you like docker to run at boot?\n"

echo "1. Yes"
echo -e "2. No\n"

read boot;

echo -e "\n"

case $boot in

        1) sudo chkconfig docker on; echo -e "You are now entering your Fedora install via docker\n";;
        2) echo -e "You are now entering your Fedora install via docker\n";;

esac

ehco -e "Please check out http://docs.docker.io/en/latest/ for documentation on this application.\n"

sudo docker run -i -t fedora /bin/bash
