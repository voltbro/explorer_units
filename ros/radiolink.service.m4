[Unit]
Description=Radio control node
Requires=movement_control.service joy_node.service
After=movement_control.service joy_node.service
REQUIRES_CORE

[Service]
ExecStart=/opt/voltbro/ros/scripts/radiolink.sh
User=root
SERVICE_DEFAULTS

REQUIRED_ROS
RequiredBy=command_processor.service