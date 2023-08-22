#!/usr/bin/env bash
source /opt/voltbro/ros/scripts/setup.sh

roslaunch --wait --sigterm-timeout=10 cyphal_bridge cyphal_bridge.launch
