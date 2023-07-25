#!/usr/bin/env bash
source /opt/voltbro/ros/scripts/setup.sh

chmod a+rw /dev/input/js0
rosrun joy joy_node
