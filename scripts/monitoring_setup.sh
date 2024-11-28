#!/bin/bash

# Install Ganglia
sudo apt install ganglia-monitor -y

# Copy Ganglia configuration file
sudo cp /vagrant/gmond.conf /etc/ganglia/gmond.conf

# Restart and Enable the service
sudo systemctl restart ganglia-monitor
sudo systemctl enable ganglia-monitor