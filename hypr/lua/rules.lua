---@diagnostic disable: undefined-global
-- workspace rules

hl.workspace_rule({
	workspace = "1",
	monitor = "HDMI-A-1",
	persistent = true,
})

hl.workspace_rule({
	workspace = "2",
	monitor = "HDMI-A-1",
	persistent = true,
	layout = "master",
})

for i = 3, 9 do
	hl.workspace_rule({
		workspace = i,
		monitor = "HDMI-A-1",
		persistent = true,
	})
end

hl.workspace_rule({
	workspace = "10",
	monitor = "eDP-1",
	persistent = true,
	layout = "master",
})

-- window rule
hl.window_rule({
	name = "noctalia",
	match = { class = "dev.noctalia.Noctalia" },
	border_size = 0,
	rounding = 0,
	float = true,
	size = { 1200, 800 },
})

hl.window_rule({
	name = "magic",
	match = { workspace = "special:magic" },
	border_color = "#abcdef",
})

hl.window_rule({
	name = "floats",
	match = { float = true },
	center = true,
})

hl.window_rule({
	name = "output_picker",
	match = { class = "hyprland-share-picker" },
	float = true,
})
