[Unit]
Description=Roscore service
Requires=board.service
After=board.service

[Service]
ExecStart=/opt/voltbro/ros/scripts/roscore.sh
SERVICE_DEFAULTS

REQUIRED_ROS
RequiredBy=imu.service
RequiredBy=movement_control.service
RequiredBy=radiolink.service
RequiredBy=joy_node.service
RequiredBy=command_processor.service
