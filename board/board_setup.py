import subprocess
from systemd import journal, daemon

from config import config


def setup_can() -> bool:
    journal.send("Setting up can")

    CAN_CONFIG = config["CAN"]
    CAN_TYPE = CAN_CONFIG["type"]
    CAN_BITRATE = CAN_CONFIG.get("bitrate", "1000000")
    CAN_DBITRATE = CAN_CONFIG.get("dbitrate", "8000000")

    if CAN_TYPE == "fd":
        CAN_COMMAND = "ip link set {iface} up type can bitrate {bitrate} dbitrate {dbitrate} restart-ms 1000 berr-reporting on fd on"
    elif CAN_TYPE == "classic":
        CAN_COMMAND = "ip link set {iface} up txqueuelen 65535 type can bitrate {bitrate} berr-reporting on"
    else:
        journal.send(f"Unknown CAN type {CAN_TYPE}")
        return False

    for iface in ("can0", "can1"):
        cmd = CAN_COMMAND.format(iface=iface, bitrate=CAN_BITRATE, dbitrate=CAN_DBITRATE)
        journal.send(f"Running {cmd}...")
        retcode = subprocess.call(cmd.split(" "))
        if retcode != 0:
            journal.send(f"Failed to configure {iface}, stopping can config", RETCODE=retcode)
            break
    else:
        return True
    return False


def main() -> None:
    journal.send("Starting board configuration")
    for setup_func in (setup_can,):
        success = setup_func()
        if not success:
            journal.send(f"Failed during {setup_func.__name__}")
            return 1
    else:
        journal.send("All done")
        return 0
    

if __name__ == '__main__':
    exit(main())
