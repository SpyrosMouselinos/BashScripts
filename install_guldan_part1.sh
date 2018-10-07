#!/bin/bash
echo "Hello this is the Spyros-Guldan installation script!"
sleep 1
clear
echo "Lets update your system"
sudo apt update
sudo apt upgrade
clear
echo "Ok, next lets install the basic C/C++ utils"
sudo apt install build-essential
sleep 1
clear 
echo "Ok lets now install Apache Server"
sleep 1
sudo apt install apache2
sleep 1
clear
echo "Lets configure the firewall"
sleep 1
sudo ufw app list
sudo ufw allow 'Apache Full'
sleep 1
clear
sudo ufw status
sleep 2
clear
sudo systemctl stop apache2
echo "Apache2 configured and shutdown"
sleep 1
clear
echo "Lets install Java JDK"
sudo apt install -y openjdk-8-jre-headless
sleep 1
java -version
sleep 1
clear
echo "Lets add the Ubuntu Make Repository"
sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
sudo apt update
sudo apt install -y ubuntu-make
sleep 1
clear
echo "Lets install Pycharm!"
sudo umake ide pycharm
clear
echo "Pycharm installed"
sleep 1
echo "Lets install PostgreSQL and PG-Admin"
sudo apt-get install postgresql postgresql-contrib
clear
echo "Installed now lets configure it with new user named postgres;"
printf '\q' | sudo -i -u postgres psql&\q
sleep 1
clear
sudo apt-get install pgadmin3
clear
echo "Lets Install Nvidia Drivers"
sudo add-apt-repository ppa:graphics-drivers
sudo apt update
sudo apt install nvidia-390
clear
echo "Lets throw Viber as well"
wget -O viber.deb http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb  
sudo dpkg -i viber.deb
clear
echo "Lets install Git as well"
sudo apt install git
sleep 1
echo "Overview"
sudo apt update
sudo apt upgrade
echo "Lets make you sudo-user"
sudo usermod -aG sudo spyros
echo "You need to Reboot mate now"
