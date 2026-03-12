import json
import subprocess

text = subprocess.run(("niri", "msg", "-j", "workspaces"), text=True, capture_output=True)
print(json.dumps(text.stdout, indent=True))
