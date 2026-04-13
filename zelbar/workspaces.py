#!/bin/env python

import subprocess
import sys

output = subprocess.run(
    ("mmsg", "-g", "-t"), capture_output=True, text=True
).stdout

echo = ""
nbg = "%{B:0x343434}"
nfg = "%{F:0xFFFFFF}"
abg = "%{B:0x676767}"
afg = nfg
fbg = "%{B:0xFFFFFF}"
ffg = "%{F:0x000000}"
ubg = "%{B:0xFF0000}"
ufg = nfg
separator=" %{B:0x343434}%{F:0xABABAB}|"

if len(sys.argv) > 1:
    for i in range(1, 10):
        prompt = sys.argv[1] + " tag " + str(i)
        index = output.find(prompt)
        state = output[index + len(prompt) + 1]
        clients = output[index + len(prompt) + 3]
        if state == "0":
            if clients == "0":
                echo += nbg + nfg
            else:
                echo += abg + afg
        elif state == "1":
            echo += fbg + ffg
        elif state == "2":
            echo += ubg + ufg

        echo += " " + str(i) + separator

print(echo)
