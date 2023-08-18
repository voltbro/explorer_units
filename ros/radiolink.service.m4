[Unit]
Description=Radio control node
Requires=command_processor.service joy_node.service
After=command_processor.service joy_node.service
REQUIRES_CORE

[Service]
ExecStart=/opt/voltbro/ros/scripts/radiolink.sh
User=root
SERVICE_DEFAULTS

REQUIRED_ROS
