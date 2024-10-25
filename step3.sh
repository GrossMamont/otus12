#!/bin/bash

sudo apt install nginx -y

echo "Создадим /etc/systemd/system/nginx@.service"
sudo cp /vagrant/nginx@.service /etc/systemd/system/nginx@.service
#echo "Проверим /etc/systemd/system/nginx@.service"
#sudo cat /etc/systemd/system/nginx@.service
echo "#######################################################################"

echo "Создадим /etc/nginx/nginx-first.conf"
sudo cp /vagrant/nginx-first.conf /etc/nginx/nginx-first.conf
#echo "Проверим /etc/nginx/nginx-first.conf"
#sudo cat /etc/nginx/nginx-first.conf
echo "#######################################################################"

echo "Создадим /etc/nginx/nginx-second.conf"
sudo cp /vagrant/nginx-second.conf /etc/nginx/nginx-second.conf
#echo "Проверим /etc/nginx/nginx-second.conf"
#sudo cat /etc/nginx/nginx-second.conf
echo "#######################################################################"

sudo systemctl start nginx@first
sudo systemctl status nginx@first
sudo systemctl start nginx@second
sudo systemctl status nginx@second

sudo ss -tnulp | grep nginx
sudo ps afx | grep nginx

