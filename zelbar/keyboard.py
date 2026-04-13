#!/bin/env python

import subprocess
import sys

output = subprocess.run(
    ("mmsg", "-g", "-k"), capture_output=True, text=True
).stdout

if len(sys.argv) > 1:
    prompt = sys.argv[1] + " kb_layout"
    start_index = output.find(prompt) + len(prompt) + 1
    end_index = output.find("\n", start_index)
    print(output[start_index: end_index].upper())
