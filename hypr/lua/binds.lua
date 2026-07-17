---@diagnostic disable: undefined-global
local SUPER = "SUPER"
local ALT = "ALT"
local CTRL = "CTRL"
local TAB = "TAB"
local SHIFT = "SHIFT"
local PRINT = "PRINT"
local RETURN = "RETURN"
local ESCAPE = "ESCAPE"

local ARROWS = { left = "H", right = "L", up = "K", down = "J" }

-- Set programs that you use
local terminal = "kitty"
local menu = "rofi -show drun"
local control_center = "noctalia msg panel-toggle control-center"
local session = "noctalia msg panel-toggle session"

local function Super(k1, k2, k3)
	return table.concat({ SUPER, k1, k2, k3 }, " + ")
end

local function Alt(k1, k2, k3)
	return table.concat({ ALT, k1, k2, k3 }, " + ")
end

local function Ctrl(k1, k2, k3)
	return table.concat({ CTRL, k1, k2, k3 }, " + ")
end

hl.bind(Super(PRINT), hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(Super(SHIFT, PRINT), hl.dsp.exec_cmd("hyprshot -m output --clipboard-only"))
hl.bind(Alt(PRINT), hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(Alt(SHIFT, PRINT), hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"))
hl.bind(Ctrl(PRINT), hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(Ctrl(SHIFT, PRINT), hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(Super(RETURN), hl.dsp.exec_cmd(terminal))
hl.bind(Super(SHIFT, "Q"), hl.dsp.window.close())
hl.bind(Super(SHIFT, ESCAPE), hl.dsp.exec_cmd(session))

hl.bind(Super("R"), hl.dsp.submap("resize"))

hl.define_submap("resize", function()
	hl.bind(ARROWS.right, function()
		hl.dispatch(hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
	end, { repeating = true })

	hl.bind(ARROWS.left, function()
		hl.dispatch(hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
	end, { repeating = true })

	hl.bind(ESCAPE, hl.dsp.submap("reset"))
end)

hl.bind(Super("F"), hl.dsp.layout("colresize 1"))
hl.bind(Super(SHIFT, "F"), hl.dsp.window.fullscreen())

hl.bind(
	Super(SHIFT, "M"),
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

hl.bind(Super("V"), function()
	hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
	hl.dispatch(hl.dsp.window.resize({ x = 1200, y = 800 }))
end)
hl.bind(Super("D"), hl.dsp.exec_cmd(menu))
hl.bind(Super(SHIFT, "D"), hl.dsp.exec_cmd(control_center))

-- Move focus with mainMod + arrow keys
for dir, key in pairs(ARROWS) do
	hl.bind(Super(key), hl.dsp.focus({ direction = dir }))
	hl.bind(Super(SHIFT, key), hl.dsp.window.swap({ direction = dir }))
end

local function get_next_output()
	local output = hl.get_active_monitor()
	if output then
		local next_output = hl.get_monitor(output.id + 1)
		if next_output then
			return next_output
		end
		local prev_output = hl.get_monitor(output.id - 1)
		if prev_output then
			return prev_output
		end
	end
end

hl.bind(Super(SHIFT, TAB), function()
	local next_output = get_next_output()
	if next_output then
		hl.dispatch(hl.dsp.window.move({ monitor = next_output }))
	end
end)

hl.bind(Super(TAB), function()
	local next_output = get_next_output()
	if next_output then
		hl.dispatch(hl.dsp.focus({ monitor = next_output }))
	end
end)

-- Switch workspaces with mainMod + [1-10]
-- Move active window to a workspace with mainMod + SHIFT + [1-10]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(Super(key), hl.dsp.focus({ workspace = i }))
	hl.bind(Super(SHIFT, key), hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(Super("S"), hl.dsp.workspace.toggle_special("magic"))

hl.bind(Super(SHIFT, "S"), function()
	local s_ws = hl.get_active_special_workspace()
	if s_ws then
		local ws = hl.get_active_workspace()
		hl.dispatch(hl.dsp.window.move({ workspace = ws }))
	else
		hl.dispatch(hl.dsp.window.move({ workspace = "special:magic" }))
	end
end)

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(Super("mouse_down"), hl.dsp.focus({ workspace = "e-1" }))
hl.bind(Super("mouse_up"), hl.dsp.focus({ workspace = "e+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(Super("mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(Super("mouse:273"), hl.dsp.window.resize(), { mouse = true })

local fn_keys = {
	XF86AudioRaiseVolume = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
	XF86AudioLowerVolume = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
	XF86AudioMute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
	XF86AudioMicMute = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
	XF86MonBrightnessUp = "brightnessctl -e4 -n2 set 5%+",
	XF86MonBrightnessDown = "brightnessctl -e4 -n2 set 5%-",
	XF86AudioNext = "playerctl next",
	XF86AudioPause = "playerctl play-pause",
	XF86AudioPlay = "playerctl play-pause",
	XF86AudioPrev = "playerctl previous",
}

for key, action in pairs(fn_keys) do
	hl.bind(key, hl.dsp.exec_cmd(action), { locked = true, repeating = true })
end
