#!/usr/bin/env bash

OP_STATE_FILE=/sys/class/net/vcan0/operstate

if [ -f "$OP_STATE_FILE" ]; then
    echo "vcan is up"
    exit 0
fi

sudo modprobe vcan
sudo ip link add dev vcan0 type vcan
sudo ip link set vcan0 mtu 72
sudo ip link set vcan0 up
