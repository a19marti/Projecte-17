#!/bin/bash

#Aqui fem una actualitzacio dels repositoris
apt-get update

#IAquí instalem el servei apache2
apt-get install -y apache2

#Aqui instalem el php versio 5
apt-get install -y php5 php5-mysql

#Aqui instalem el servei git
sudo apt-get install -y git

#Iniciem el servei apache2
sudo /etc/init.d/apache2 restart

#Entrem al directiro del apache
cd /var/www/html

#Gracies el git descarguem el servei adminer del github
git clone https://github.com/vrana/adminer.git