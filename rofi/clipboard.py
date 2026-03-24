#!/bin/env python

import subprocess
import sys

if len(sys.argv) > 1:
    if "\t" in sys.argv[1]:
        clip_id, clip_content = sys.argv[1].split("\t")
        print(clip_id)
        print(clip_content)
        # subprocess.run(("wl-paste"))
    elif sys.argv[1] == "удалить всё":
        subprocess.run(("cliphist", "wipe"))
else:
    print("удалить всё")
    text = subprocess.run(("cliphist", "list"), capture_output=True, text=True).stdout
    for i in text.split("\n"):
        print(i)
