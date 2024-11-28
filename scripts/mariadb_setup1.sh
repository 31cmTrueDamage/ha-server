#!/bin/bash

# Install MariaDB, Pacemaker, Corosync and Pcs
sudo apt install pacemaker corosync pcs -y

# Copy MariaDB configuration file
sudo cp /vagrant/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Check if MariaDB was installed already in the /cluster/sql folder
if [ "$(ls -A /cluster/sql)" ]; then
    # Folder is not empty, so MariaDB was installed already in the other machine
    sleep 5
else
    # Folder is empty or does not exist, so MariaDB was not installed yet
    sudo mkdir -p /cluster/sql
    sudo mariadb-install-db --defaults-file=/etc/mysql/my.cnf
    sudo chmod -R 777 /cluster/sql
fi

sudo systemctl restart mariadb

# Copy Corosync configuration file and start the services
sudo cp /vagrant/corosync.conf /etc/corosync/corosync.conf
sudo systemctl enable --now corosync pacemaker pcsd

# Create the MariaDB resource
sudo pcs resource create mariadb systemd:mariadb op monitor interval=1s

# Disable STONITH since we won't be using it
sudo pcs property set stonith-enabled=false

# Create the VirtualIP resource
sudo pcs resource create virtualip ocf:heartbeat:IPaddr2 ip=192.168.30.110 cidr_netmask=24 op monitor interval=1s

# Set the Mariadb resource to start with the VirtualIP resource
sudo pcs constraint colocation add mariadb with virtualip INFINITY

# Set the migration threshold
sudo pcs resource update mariadb meta migration-threshold=0
sudo pcs resource update virtualip meta migration-threshold=0

# Restart the services
sudo systemctl restart corosync pacemaker pcsd