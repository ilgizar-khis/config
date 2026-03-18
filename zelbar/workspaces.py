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
output = ""

focused = "%{B:0xFFFFFF}%{F:0x333333}"
unfocused = "%{B:0x333333}%{F:0xFFFFFF}"

for i in range(5):
    if i <= len(workspaces) - 1:
        if "*" in workspaces[i]:
            output += f"{focused} {i + 1} "
        else:
            output += f"{unfocused} {i + 1} "
    else:
        output += f"{unfocused} {i + 1} "
print(output)
