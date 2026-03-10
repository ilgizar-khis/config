import os
import shutil

current_dir = os.path.dirname(__file__) + "/"
home = str(os.getenv("HOME")) + "/"
print(home)
targets: dict[str, str] = {
    "bg": "Pictures/.bg",
    "vimrc": "-.vimrc",
    "nvim": ".config/nvim",
    "kitty": ".config/kitty",
    "polybar": "-.config/polybar",
    "vifm": ".config/vifm",
    "i3": "-.config/i3",
    "bspwmrc.sh": "-.config/bspwm/bspwmrc",
    "sxhkdrc": "-.config/sxhkd/sxhkdrc",
    "niri": ".config/niri",
    "waybar": ".config/waybar",
}


safe_mod = True
if safe_mod:
    print("safe mod enabled")
else:
    print("safe mod disabled")
    safe_mod = input("Your want enable safe mod?").lower() in ("y", "yes")
for source, target in targets.items():
    if target[0] == "-":
        print(current_dir + source, "ignored")
        continue
    if os.path.exists(home + target) and not safe_mod:
        if os.path.isdir(home + target):
            if os.path.islink(home + target):
                os.remove(home + target)
            else:
                shutil.rmtree(home + target)
        else:
            os.remove(home + target)
    print(current_dir + source, "->", home + target)
    if not safe_mod:
        os.symlink(current_dir + source, home + target)
