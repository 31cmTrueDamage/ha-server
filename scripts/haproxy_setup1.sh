#!/bin/bash

# Copy Corosync configuration file and start the services
sudo systemctl enable --now corosync pacemaker pcsd

# Create the MariaDB resource
sudo pcs resource create haproxy systemd:haproxy op monitor interval=1s

# Disable STONITH since we won't be using it
sudo pcs property set stonith-enabled=false

# Create the VirtualIP resource
sudo pcs resource create virtualip ocf:heartbeat:IPaddr2 ip=172.20.30.100 cidr_netmask=24 op monitor interval=1s

# Set the Mariadb resource to start with the VirtualIP resource
sudo pcs constraint colocation add haproxy with virtualip INFINITY

# Set the migration threshold
sudo pcs resource update haproxy meta migration-threshold=0
sudo pcs resource update virtualip meta migration-threshold=0

# Restart the services
sudo systemctl restart corosync pacemaker pcsd