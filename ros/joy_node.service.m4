[Unit]
Description=ROS Joystick driver
PathExists=/dev/input/js0
REQUIRES_CORE

[Service]
ExecStart=/opt/voltbro/ros/scripts/joy_node.sh
User=root
SERVICE_DEFAULTS

REQUIRED_ROS
