import os

for i, file in enumerate(os.listdir()):
    if file[0] == "." or file[-3:] == ".py":
        continue
    _, file_type = file.split(".")
    os.rename(file, f"{i}.{file_type}")

