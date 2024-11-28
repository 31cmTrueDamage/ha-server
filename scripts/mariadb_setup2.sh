#!/bin/bash

# Install MariaDB, Pacemaker, Corosync and Pcs
sudo apt install pacemaker corosync pcs -y

# Copy MariaDB configuration file
sudo cp /vagrant/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

sudo chmod -R 777 /cluster/sql

# Copy Corosync configuration file and start the services
sudo cp /vagrant/corosync.conf /etc/corosync/corosync.conf
sudo systemctl enable --now corosync pacemaker pcsd

# Restart the services
sudo systemctl restart corosync pacemaker pcsd