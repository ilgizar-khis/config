#!/usr/bin/env python3
import os
import json
from datetime import datetime

def main():
    # Generate timestamp for history filename
    ts = datetime.now()
    timestamp_str = ts.strftime("%Y_%m_%d__%H_%M_%S")
    
    # Hidden history file for this run
    history_file = f".rename_story_{timestamp_str}.json"
    
    # Skip hidden files and this script
    skip_files = {".rename.py", history_file}
    
    run_log = {
        "timestamp": ts.isoformat(),
        "changes": []
    }
    
    for i, file in enumerate(os.listdir()):
        if file[0] == "." or file.endswith(".py"):
            continue
        
        # Get file extension
        *name_parts, file_type = file.split(".")
        file_type = file_type.lower()
        
        new_name = f"{i}.{file_type}"
        
        # Skip if already renamed
        if file == new_name:
            continue
        
        os.rename(file, new_name)
        run_log["changes"].append({
            "old": file,
            "new": new_name
        })
        print(f"{file} → {new_name}")
    
    # Save history (hidden file)
    with open(history_file, "w") as f:
        json.dump(run_log, f, indent=2)
    
    print(f"\nИстория сохранена в {history_file}")

if __name__ == "__main__":
    main()

