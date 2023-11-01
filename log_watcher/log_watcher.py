import shutil, psutil, os

from pathlib import Path
from os.path import getctime
from datetime import datetime, timedelta

import rospy

from config import config

if psutil.Process(os.getpid()).ppid() == 1:
    IS_UNDER_SYSTEMD = True
    from systemd import journal
else:
    IS_UNDER_SYSTEMD = False
    class BogusJournal:
        def send(self, msg, *args, **kwargs):
            print(msg)

    journal = BogusJournal()

try:
    RUN_ID = rospy.get_param('/run_id')
except OSError:
    RUN_ID = None
LOG_DIR  = Path(config["LOGS"].get('ros_logs', '/root/.ros/log'))
journal.send(f"Checking logs in {LOG_DIR}")

NOW = datetime.now()
threshold = NOW - timedelta(days=3)

dirs = [d for d in LOG_DIR.iterdir() if (d.is_dir() and d.stem != RUN_ID)]

for log_dir in dirs:
    if datetime.fromtimestamp(getctime(log_dir)) >= threshold:
        continue
    journal.send(f"Deleting {log_dir}")
    shutil.rmtree(log_dir)
