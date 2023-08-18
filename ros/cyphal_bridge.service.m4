[Unit]
Description=wheels_vel provider
REQUIRES_CORE

[Service]
ExecStart=/opt/voltbro/ros/scripts/cyphal_bridge.sh
SERVICE_DEFAULTS

REQUIRED_ROS
RequiredBy=command_processor.service
