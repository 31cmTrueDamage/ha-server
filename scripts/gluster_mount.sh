#!/bin/bash

echo 'localhost:/storage /cluster glusterfs defaults,_netdev 0 0' | sudo tee -a /etc/fstab

sudo mount -a