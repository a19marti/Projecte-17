#!/bin/bash

#Aqui fem una actualitzacio dels repositoris
apt-get update

#Aqui instalem els serveis debconf-utils
apt-get install -y debconf-utils

#Primer declarem la contrasenya i tot seguit la contrassenya del mysql
DB_ROOT_PASSWD=admin
locale-gen es_ES.UTF-8
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_ROOT_PASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_ROOT_PASSWD"

#Aqui instalem el servei mysql-server
apt install -y mysql-server-5.5

#Aqui autoritzem l'entrada des de qualsevol host.
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf

#Aqui reiniciem el servei mysql
/etc/init.d/mysql restart

#Aqui entrem al mysql i li donem tots el privilegis al usuari root
mysql -u root -p$DB_ROOT_PASSWD <<< "GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY '$DB_ROOT_PASSWD'; FLUSH PRIVILEGES;"
mysql -u root -p$DB_ROOT_PASSWD <<< "CREATE DATABASE bd-pt17;"