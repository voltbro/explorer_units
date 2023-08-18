#!/usr/bin/env zx

await $`./apply_m4.sh`

let unit_dir = "/etc/systemd/system"

await $`sudo mkdir -p ${unit_dir}`

async function link_service(serv_dir, serv_name) {
    await $`sudo rm -f ${unit_dir}/${serv_name} && sudo ln -s /opt/voltbro/${serv_dir}/${serv_name} ${unit_dir}/${serv_name}`;
}

await link_service("board", "board.service")
await link_service("eth_can", "eth_can.service")
await link_service("eth_can", "vcan_config.service")

await link_service("ros", "ros.target")
await link_service("ros/services", "roscore.service")
await link_service("ros/services", "imu.service")
await link_service("ros/services", "cyphal_bridge.service")
await link_service("ros/services", "radiolink.service")
await link_service("ros/services", "joy_node.service")
await link_service("ros/services", "command_processor.service")

await $`sudo systemctl daemon-reload`
