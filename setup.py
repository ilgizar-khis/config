import os
import shutil

def print_ignores():
    for item in ignore:
        print(f"- { item }")


def print_targets():
    for from_, to_ in targets.items():
        print(f"{from_} -> {to_}")


current_dir = os.path.dirname(__file__)
print(current_dir)

home = str(os.getenv("HOME")) + "/"
print(home)

ignore = ["setup.py"]
print_ignores()

targets = {"bg": "Pictures/.bg"}
print_targets()

for from_name in os.listdir(current_dir):
    if from_name in ignore:
        continue
    target_name = home + ".config/" + from_name
    if from_name in targets:
        target_name = targets[from_name]
    if os.path.exists(target_name):
        if os.path.isdir(target_name):
            shutil.rmtree(target_name)
        else:
            os.remove(target_name)
    print(f"{from_name} -> {target_name}")
    os.symlink(current_dir + "/" + from_name, target_name)
