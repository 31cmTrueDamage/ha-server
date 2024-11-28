#!/bin/bash

sudo apt-get install mariadb-server mariadb-client -y

echo "192.168.30.111 node1" | sudo tee -a /etc/hosts > /dev/null
echo "192.168.30.112 node2" | sudo tee -a /etc/hosts > /dev/null