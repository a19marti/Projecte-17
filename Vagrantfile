# -*- mode: ruby -*-
# vi: set ft=ruby :
 
#Linea que comença la configuració del vagrant file
Vagrant.configure("2") do |config|

#Instalem el box que necesitem en aquest cas ubuntu
  config.vm.box = "ubuntu/trusty64"
#Aqui configurem la carpeta compartida per que la puguin veure
  config.vm.synced_folder "./", "/vagrant"
#Aqui configurem el nom i la contrasenya de la maquina
  config.vm.hostname = "Projecte-PT-17"
  config.ssh.password = "pt17"
  config.vm.provider "virtualbox" do |vb|
#Aqui indiquem que te 2GB de memoria RAM
	vb.memory = "2048"
  end

#Aqui configurem la maquina apache i la mysql
  config.vm.define "Projecte-PT-17web" do |app|
	app.vm.hostname = "Projecte-PT-17web"
    #Aqui configurem la xarxa amb el Nom i la ip
	app.vm.network "public_network", ip: "192.168.2.2"
    #Aqui posem la contrasenya que volem
	app.ssh.password = "pt17"
    #Aqui configurem els ports NAT.
	app.vm.network "forwarded_port", guest: 80, host: 8080
	app.vm.provision "shell", path: "config-apache.sh"
  end
  config.vm.define "Projecte-PT-17db" do |app|
	app.vm.hostname = "Projecte-PT-17db"
	app.vm.network "public_network", ip: "192.168.2.3"
	app.ssh.password = "pt17"
	app.vm.network "forwarded_port", guest: 80, host: 4444
	app.vm.network "forwarded_port", guest: 3306, host: 3306
	app.vm.provision "shell", path: "config-mysql.sh"
  end
end