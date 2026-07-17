-- programs
local status_bar = "noctalia"
local dbus = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
local udiskie = "udiskie"

-- hyprland start
hl.on("hyprland.start", function()
	hl.exec_cmd(status_bar)
	hl.exec_cmd(dbus)
	hl.exec_cmd(udiskie)
end)
