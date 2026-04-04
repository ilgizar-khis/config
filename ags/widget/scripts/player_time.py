#!/bin/env python

import subprocess

data = subprocess.run(("playerctl", "metadata", "-f", "{{ duration(position) }}/{{ duration(mpris:length) }}"), capture_output=True, text=True)

if data.stdout:
    print(data.stdout)
else:
    print("../..")
