#!/bin/bash

sudo apt install haproxy corosync pacemaker pcs -y

sudo cp /vagrant/corosync_proxy.conf /etc/corosync/corosync.conf
sudo cp /vagrant/haproxy.cfg /etc/haproxy/haproxy.cfg

