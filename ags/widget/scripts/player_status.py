#!/bin/env python

import subprocess

status = subprocess.run(("playerctl", "status"), capture_output=True, text=True)

if status.stdout:
    print(status.stdout)
elif status.stderr:
    print("Paused")
