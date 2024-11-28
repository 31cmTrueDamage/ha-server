#!/bin/bash

sudo apt install glusterfs-server -y

sudo systemctl enable --now glusterd

sudo mkdir -p /raid1/glusterfs
sudo mkdir -p /cluster
sudo mkdir -p /cluster/www
sudo mkdir -p /cluster/sql

echo "Instalação do Gluster completa."