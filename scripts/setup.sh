#!bin/bash

echo "A atualizar lista..."
apt update -y

echo "A instalar pacotes..."
apt upgrade -y

echo "A limpar pacotes desnecessários..."
apt autoremove -y

sudo apt install sshpass
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

echo "Atualização do sistema completa."