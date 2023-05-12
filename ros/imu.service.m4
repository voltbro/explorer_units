[Unit]
Description=Bosch IMU driver
REQUIRES_CORE

[Service]
ExecStart=/opt/voltbro/ros/scripts/imu.sh
SERVICE_DEFAULTS

REQUIRED_ROS
