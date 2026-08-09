---@diagnostic disable: undefined-global
local M = {}
local function to_cmd(tbl)
	local cmd = ""
	for _, s in ipairs(tbl) do
		cmd = cmd .. '"' .. tostring(s) .. '" '
	end
	return cmd
end

local function main(opt)
	local cmd = { "fd" }
	for _, arg in ipairs(opt.argv) do
		if string.find(arg, "^-[ah]") then
			table.insert(cmd, "--hidden")
		else
			table.insert(cmd, arg)
		end
	end
	local res = vifm.startjob({ cmd = to_cmd(cmd) }):stdout()
	local lines = {}
	for line in res:lines() do
		table.insert(lines, line)
	end
	local menu = {
		title = "result of fd",
		items = lines,
		withnavigation = true,
	}
	if #lines > 0 then
		vifm.menus.loadcustom(menu)
	else
		vifm.sb.info("no matches found")
	end
end

vifm.cmds.add({ name = "fd", maxargs = 3, handler = main, description = "use fd, not find" })

return M
