#!/bin/bash

VOLUME_DIR=/raid1/glusterfs
VOLUME_NAME=storage
SERVER1=192.168.30.121
SERVER2=192.168.30.122
SERVER3=192.168.30.111
SERVER4=192.168.30.112

sudo gluster peer probe $SERVER1
sudo gluster peer probe $SERVER2
sudo gluster peer probe $SERVER3
sudo gluster peer probe $SERVER4

sudo gluster volume create $VOLUME_NAME replica 2 transport tcp $SERVER1:$VOLUME_DIR $SERVER2:$VOLUME_DIR $SERVER3:$VOLUME_DIR $SERVER4:$VOLUME_DIR force
sudo gluster volume start $VOLUME_NAME

