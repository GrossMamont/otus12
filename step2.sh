#!/bin/bash

sudo apt update
sudo apt install -y spawn-fcgi php php-cgi php-cli apache2 libapache2-mod-fcgid

echo "Создадим /etc/spawn-fcgi/fcgi.conf"
sudo mkdir /etc/spawn-fcgi
sudo cp /vagrant/fcgi.conf /etc/spawn-fcgi/fcgi.conf
#echo "Проверим /etc/spawn-fcgi/fcgi.conf"
#sudo cat /etc/spawn-fcgi/fcgi.conf
echo "#######################################################################"

echo "Создадим /etc/systemd/system/spawn-fcgi.service"
sudo cp /vagrant/spawn-fcgi.service /etc/systemd/system/spawn-fcgi.service
#echo "Проверим /etc/systemd/system/spawn-fcgi.service"
#sudo cat /etc/systemd/system/spawn-fcgi.service
echo "#######################################################################"

sudo systemctl start spawn-fcgi
sudo systemctl status spawn-fcgi
