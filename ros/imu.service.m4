[Unit]
Description=Bosch IMU driver
PathExists=/dev/ttyUSB0
REQUIRES_CORE

[Service]
ExecStart=/opt/voltbro/ros/scripts/imu.sh
SERVICE_DEFAULTS

REQUIRED_ROS
