[Unit]
Description=cmd_vel processor
Requires=cyphal_bridge.service redis-server.service
After=cyphal_bridge.service redis-server.service
REQUIRES_CORE

[Service]
ExecStart=/opt/voltbro/ros/scripts/command_processor.sh
SERVICE_DEFAULTS

REQUIRED_ROS
RequiredBy=radiolink.service
