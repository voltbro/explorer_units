[Unit]
Description=Radio control node
Requires=movement_control.service
REQUIRES_CORE

[Service]
ExecStart=/opt/voltbro/ros/scripts/radiolink.sh
User=root
SERVICE_DEFAULTS

REQUIRED_ROS
