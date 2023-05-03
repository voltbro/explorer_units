#!/usr/bin/env zx

let unit_dir = "/etc/systemd/system"

await $`sudo mkdir -p ${unit_dir}`
await $`sudo rm -f ${unit_dir}/board.service && sudo ln -s /opt/voltbro/board/board.service ${unit_dir}/board.service`
await $`sudo systemctl daemon-reload`
