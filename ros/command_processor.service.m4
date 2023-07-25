[Unit]
Description=cmd_vel processor
Requires=movement_control.service radiolink.service
After=movement_control.service radiolink.service
REQUIRES_CORE

[Service]
ExecStart=/opt/voltbro/ros/scripts/command_processor.sh
SERVICE_DEFAULTS

REQUIRED_ROS

