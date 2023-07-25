#!/usr/bin/env bash
source /opt/voltbro/ros/scripts/setup.sh

roslaunch --wait bosch_imu_driver imu.launch
