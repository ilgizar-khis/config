vim.pack.add({ "https://github.com/nvim-mini/mini.tabline.git" })

local MiniTabline = require("mini.tabline")
MiniTabline.setup({
	format = function(buf_id, label)
		local suffix = vim.bo[buf_id].modified and "[+]" or "[ ]"
		return " " .. MiniTabline.default_format(buf_id, label) .. suffix
	end,
})

local sel_hl = { bg = "none", fg = "#ffffff", bold = true }
local hl = { bg = "none", fg = "#888899" }

vim.api.nvim_set_hl(0, "MiniTablineCurrent", sel_hl)
vim.api.nvim_set_hl(0, "MiniTablineVisible", sel_hl)
vim.api.nvim_set_hl(0, "MiniTablineHidden", hl)
vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", sel_hl)
vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", sel_hl)
vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", hl)
