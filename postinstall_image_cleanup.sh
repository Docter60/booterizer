#!/usr/bin/bash

echo "Clearing shell history."
rm -f /home/pi/.bash_history
rm -f /root/.bash_history

echo "Clearing wifi config."
cat << EOF > /etc/wpa_supplicant/wpa_supplicant.conf
country=US
update_config=1
ctrl_interface=/var/run/wpa_supplicant

network={
  scan_ssid=1
  ssid="CHANGEME"
  psk="CHANGEME"
}
EOF

echo "Cleaning apt caches."
apt-get clean -y
apt-get autoclean -y

echo "Cleaning up install media"
rm /vagrant/irix/6.5.30/Overlay/disc1/disc1.tar.gz
rm /vagrant/irix/6.5.30/Overlay/disc2/disc2.tar.gz
rm /vagrant/irix/6.5.30/Overlay/disc3/disc3.tar.gz
rm /vagrant/irix/6.5.30/Overlay/apps/apps.tar.gz
rm /vagrant/irix/6.5.30/Overlay/capps/capps.tar.gz
rm /vagrant/irix/6.5.22/Overlay/disc1/disc1.tar.gz
rm /vagrant/irix/6.5.22/Overlay/disc2/disc2.tar.gz
rm /vagrant/irix/6.5.22/Overlay/disc3/disc3.tar.gz
rm /vagrant/irix/6.5.22/Overlay/apps/apps.tar.gz
rm /vagrant/irix/6.5/Development/devlibs/developmentlibraries.tar.gz
rm /vagrant/irix/6.5/Development/mipspro_ap/mipsproap.tar.gz
rm /vagrant/irix/6.5/Development/mipspro_c/mipspro_c.tar.gz
rm /vagrant/irix/6.5/Development/mipspro_cee/mipspro_cee.tar.gz
rm /vagrant/irix/6.5/Development/mipspro_cpp/mipspro_cpp.tar.gz
rm /vagrant/irix/6.5/Development/mipspro_update/mipspro744update.tar.gz
rm /vagrant/irix/6.5/Development/mipspro/mipspro-7.4.3m.tar
rm /vagrant/irix/6.5/Development/prodev/prodev.tar.gz
rm /vagrant/irix/6.5/Extras/sgifonts/sgipostscriptfonts.tar.gz
rm /vagrant/irix/6.5/Extras/perfcopilot/perfcopilot.tar.gz
rm /vagrant/irix/6.5/Foundation/disc1/foundation1.tar.gz
rm /vagrant/irix/6.5/Foundation/disc2/foundation2.tar.gz
rm /vagrant/irix/6.5/Foundation/nfs/onc3nfs.tar.gz
rm /vagrant/irix/5.3/Development/devfoundations/irix_5_3_development.tgz
rm /vagrant/irix/5.3/Foundation/disc1/irix_5_3_foundation.tgz

echo "Zeroing free space. This will take a while."
dd if=/dev/zero of=/EMPTY bs=1M 
rm -f /EMPTY
echo "Run 'halt -p'."

