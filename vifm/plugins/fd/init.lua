---@diagnostic disable: undefined-global
local M = {}
local function to_cmd(tbl)
	local cmd = ""
	for _, s in ipairs(tbl) do
		if string.find(s, "^%~") then
			s = string.gsub(s, "^%~", tostring(os.getenv("HOME")))
		elseif string.find(s, "^%.") then
			s = string.gsub(s, "^%.", tostring(os.getenv("PWD")))
		end
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

local function complete(opt)
	local view = vifm.currview()
	if string.find(opt.arg, "^%-") then
		local line = ""
		for i = 1, #opt.argv - 1 do
			line = line .. opt.argv[i] .. " "
		end
		line = line .. "--hidden"
		return { matches = { line } }
	end
	if #opt.argv > 1 then
		local files = {}
		local line = ""
		for i = 1, #opt.argv - 1 do
			line = line .. opt.argv[i] .. " "
		end
		for entry in view:entries() do
			if string.find(entry.name, "^" .. opt.arg) then
				table.insert(files, line .. " " .. tostring(os.getenv("PWD")) .. "/" .. entry.name)
			end
		end
		return { matches = files }
	end
end

vifm.cmds.add({ name = "fd", maxargs = 3, handler = main, description = "use fd, not find", complete = complete })

return M
