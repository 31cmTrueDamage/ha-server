#!/bin/bash

sudo apt install mdadm -y

# Use a here-document to send "yes" input to the mdadm command
sudo bash <<EOF
yes | mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/sdc /dev/sdd -R
EOF

sudo mkfs.ext4 /dev/md0

sudo mkdir /raid1
sudo mount /dev/md0 /raid1

echo '/dev/md127 /raid1 ext4 defaults 0 0' | sudo tee -a /etc/fstab
