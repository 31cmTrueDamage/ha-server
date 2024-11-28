#!/bin/bash

sudo systemctl enable --now corosync pacemaker pcsd

sudo systemctl restart corosync pacemaker pcsd