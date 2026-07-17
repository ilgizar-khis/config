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

-- Example window rules that are useful
hl.window_rule({
	name = "TLauncher",
	match = { class = "org-tlauncher-tlauncher-rmo-TLauncher" },
	float = true,
	center = true,
})

hl.window_rule({
	name = "nwg-look",
	match = { class = "nwg-look" },
	float = true,
})

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
