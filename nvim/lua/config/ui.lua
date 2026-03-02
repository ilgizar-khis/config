vim.cmd("colorscheme retrobox")

vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#555555" })

vim.opt.fillchars:append({
	vert = "|",
	horiz = "-",
	eob = " ",
})

local devicons = require("nvim-web-devicons")

function status_line()

	local branch = vim.b.gitsigns_head or ""
	local status = vim.b.gitsigns_status or ""

    if branch then
        branch = " [ " .. branch
        if status then
            branch = branch .. " | " .. status
        end
        branch = branch .. " ] "
    else
        branch = ""
    end


	if vim.fn.expand("%:~:.") == "" or vim.bo.buftype ~= "" then
		return "%t" -- для специальных буферов показываем только имя
	end
	return " " .. vim.fn.expand("%:~:.") .. "%m"   ..  branch .. " %r %w%=%y %l:%c %p%%"
end

vim.opt.laststatus = 3
vim.opt.statusline = "%!v:lua.status_line()"

function _G.my_tabline()
	local tabline = ""
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()

	for _, buf in ipairs(buffers) do
		if vim.api.nvim_buf_is_loaded(buf) then
			local buf_name = vim.api.nvim_buf_get_name(buf)
			if string.find(buf_name, "neo%-tree") then
				goto continue
			elseif string.find(buf_name, "toggleterm") then
				goto continue
			elseif buf_name == "" and buf ~= current_buf then
				-- buf_name += "NoName"
				goto continue
			end
			buf_name = vim.fn.fnamemodify(buf_name, ":t")

			local is_modified = vim.api.nvim_buf_get_option(buf, "modified")
			local mod_symbol = is_modified and " [+]" or " [ ]" -- или "+" или "•"

			local ext = vim.fn.fnamemodify(buf_name, ":e")
			local icon, icon_hl = devicons.get_icon(buf_name, ext, { default = true })
			if icon_hl and icon ~= "" then
				if icon_hl:match("^#") then
					vim.api.nvim_command("highlight IconColor guifg=" .. icon_hl)
				end
			end

			icon = icon or ""

			has_buffers = true
			if #tabline > 0 then
				tabline = tabline .. "%#TabLine#"
			end

			if buf == current_buf then
				tabline = tabline .. "%#TabLineSel# " .. icon .. " " .. buf_name .. mod_symbol .. " "
			else
				tabline = tabline .. "%#TabLine# " .. icon .. " " .. buf_name .. mod_symbol .. " "
			end
		end
		::continue::
	end
	if has_buffers then
		tabline = tabline .. "%#TabLineFill# "
	else
		tabline = "%#TabLineFill# "
	end
	return tabline
end

vim.opt.showtabline = 2
vim.opt.tabline = "%!v:lua.my_tabline()"
vim.opt.mouse = "a"
-- vim.opt.winbar = "%!v:lua.status_line()"
