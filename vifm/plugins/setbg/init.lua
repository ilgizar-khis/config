---@diagnostic disable: undefined-global

local function to_cmd(tbl)
	local cmd = ""
	for _, s in ipairs(tbl) do
		cmd = cmd .. '"' .. tostring(s) .. '" '
	end
	return cmd
end

local function set_bg(output)
	local outname = ""
	if output.args ~= "" then
		outname = output.args
	else
		outname = "*"
	end
	local view = vifm.currview()
	local name = view.cursor.entry().name
	local cmd = { "swaybg", "-o", outname, "-i", name }
	vifm.sb.info(to_cmd(cmd))
	vifm.startjob({ cmd = to_cmd(cmd) })
end
assert(vifm.cmds.add({ name = "setbg", maxargs = 1, handler = set_bg }))
