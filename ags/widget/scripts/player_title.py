#!/bin/env python

import subprocess

title = subprocess.run(("playerctl", "metadata", "-f", "\"{{title}}\""), capture_output=True, text=True)

if title.stdout:
    print(title.stdout)
elif title.stderr:
    print("No title")
