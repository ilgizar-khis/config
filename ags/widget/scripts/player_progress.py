#!/bin/env python

import subprocess

position = subprocess.run(("playerctl", "position"), capture_output=True, text=True)
length = subprocess.run(("playerctl", "metadata", "-f", "\"{{mpris:length}}\""), capture_output=True, text=True)

if position.stdout and length.stdout:
    length = float(length.stdout.replace("\n", "").replace("\"", "")) / 1_000_000
    print(float(position.stdout)/float(length))
else:
    print("0")

