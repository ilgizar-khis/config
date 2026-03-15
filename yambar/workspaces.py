#!/bin/env python

import subprocess
import sys

monitor = sys.argv[1]

workspaces = subprocess.run(
    ("niri", "msg", "workspaces"), capture_output=True, text=True
).stdout.split("Output")
current_workspace = ""

for workspace in workspaces:
    if monitor in workspace:
        current_workspace = workspace
        break

workspaces = current_workspace.split("\n")[1:]
# print(workspaces)
output = []

for i in range(5):
    if i <= len(workspaces) - 1:
        if "*" in workspaces[i]:
            print(f"ws{i + 1}|bool|true")
        else:
            print(f"ws{i + 1}|bool|false")
    else:
        print(f"ws{i + 1}|bool|false")

print()
