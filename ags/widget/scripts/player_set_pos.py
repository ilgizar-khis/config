#!/bin/env python

import subprocess
import sys

length = subprocess.run(("playerctl", "metadata", "-f", "\"{{mpris:length}}\""), capture_output=True, text=True)

if len(sys.argv) > 1:
    length = float(length.stdout.replace("\n", "").replace("\"", "")) / 1_000_000
    # print(float(sys.argv[1])*length)
    subprocess.run(( "playerctl", "position", str(float(sys.argv[1])*length )))
    # print(sys.argv)
