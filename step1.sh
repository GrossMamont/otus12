#!/bin/bash

sudo apt update
sudo apt install -y mc

echo "Создадим все необходимые файлы разом"

echo "Создадим /etc/default/watchlog"
sudo cp /vagrant/watchlog /etc/default/watchlog
#echo "Проверим /etc/default/watchlog"
#sudo cat /etc/default/watchlog
echo "#######################################################################"

echo "Создадим /var/log/watchlog.log"
sudo cp /vagrant/watchlog.log /var/log/watchlog.log
echo "#######################################################################"

echo "Создадим /opt/watchlog.sh"
sudo cp /vagrant/watchlog.sh /opt/watchlog.sh
#echo "Проверим /opt/watchlog.sh"
#sudo cat /opt/watchlog.sh
sudo chmod +x /opt/watchlog.sh
echo "#######################################################################"

echo "Создадим /etc/systemd/system/watchlog.service"
sudo cp /vagrant/watchlog.service /etc/systemd/system/watchlog.service
#echo "Проверим /etc/systemd/system/watchlog.service"
#sudo cat /etc/systemd/system/watchlog.service
sudo systemctl start watchlog.service
sudo systemctl status watchlog.service
echo "#######################################################################"

echo "Создадим /etc/systemd/system/watchlog.timer"
sudo cp /vagrant/watchlog.timer /etc/systemd/system/watchlog.timer
#echo "Проверим /etc/systemd/system/watchlog.timer"
#sudo cat /etc/systemd/system/watchlog.timer

sudo systemctl start watchlog.timer
sudo systemctl status watchlog.timer
sleep 10
sudo tail -n 1000 /var/log/syslog  | grep word
