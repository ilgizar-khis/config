#!/bin/env python
import subprocess

layouts = subprocess.run(
    ("niri", "msg", "keyboard-layouts"), capture_output=True, text=True
).stdout.split("\n")

cur_layout = ""

for layout in layouts:
    if "*" in layout:
        cur_layout = layout


