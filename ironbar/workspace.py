#!/bin/env python

import subprocess

workspaces = subprocess.run(
    ("hyprctl", "workspaces"), capture_output=True, text=True
).stdout

print(workspaces)
