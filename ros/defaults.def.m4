define(`SERVICE_DEFAULTS', `Type=simple
TimeoutSec=20
Restart=on-failure
RestartSec=5
StartLimitInterval=50
StartLimitBurst=3
')dnl

define(`REQUIRES_CORE', `Requires=roscore.service
After=roscore.service')dnl

define(`REQUIRED_ROS', `[Install]
RequiredBy=ros.target')dnl
