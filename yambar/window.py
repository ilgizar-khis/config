#!/bin/env python

import subprocess

window = subprocess.run(
    ("niri", "msg", "focused-window"), capture_output=True, text=True
).stdout

if "App ID" in window:
    output = window.split("\n")[2].replace("App ID: ", "").replace('"', "")
    print(f"window|string|{ output }")
else:
    print(f"window|string|NiriWM")
print()
