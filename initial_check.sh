#!/usr/bin/bash

apt update && apt upgrade
apt install git sshpass ansible python3-pip
mkdir /home/pi/.ssh
ssh-keyscan -H localhost >> /home/pi/.ssh/known_hosts