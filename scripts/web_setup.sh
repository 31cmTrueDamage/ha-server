#!/bin/bash

sudo apt install docker-compose mysql-client -y

sudo systemctl enable --now docker

sudo docker-compose --project-directory /vagrant/ pull
sudo docker pull ubuntu:latest