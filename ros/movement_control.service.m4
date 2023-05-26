[Unit]
Description=cmd_vel provider
REQUIRES_CORE

[Service]
ExecStart=/opt/voltbro/ros/scripts/movement_control.sh
SERVICE_DEFAULTS

REQUIRED_ROS
RequiredBy=radiolink.service