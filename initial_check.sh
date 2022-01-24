#!/usr/bin/bash

apt update && apt upgrade
apt install git sshpass python3-pip
pip3 install -r $(dirname $(realpath "$0"))/ansible/requirements.txt
install -d -m 0764 -o pi -g pi /home/pi/.ssh
install -m 0764 -o pi -g pi /dev/null /home/pi/.ssh/known_hosts
ssh-keyscan -H localhost >> /home/pi/.ssh/known_hosts