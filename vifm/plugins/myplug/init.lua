---@diagnostic disable: undefined-global
do
	local function razigli()
		vifm.sb.info("Hello from razigli")
	end
	assert(vifm.cmds.add({ name = "razigli", maxargs = 0, handler = razigli }))
end
return {}
