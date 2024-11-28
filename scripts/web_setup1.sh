#!/bin/bash

# Create the folders for Ganglia, Apache and Cacti
sudo mkdir -p /cluster/www/ganglia/gmetad /cluster/www/ganglia/apache /cluster/www/cacti
sudo cp /vagrant/gmetad.conf /cluster/www/ganglia/gmetad/gmetad.conf
sudo cp /vagrant/ganglia-vhost.conf /cluster/www/ganglia/apache/ganglia-vhost.conf
sudo cp /vagrant/config.php /cluster/www/cacti/config.php

# Start the containers
sudo docker-compose --project-directory /vagrant/ up --build -d
