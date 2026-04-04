#!/bin/env python

import subprocess

players = subprocess.run(("playerctl", "metadata"), capture_output=True, text=True)

if players.stdout:
    print("True")
elif players.stderr:
    print("False")
