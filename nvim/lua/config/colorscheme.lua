vim.pack.add({
	{ src = "https://github.com/ellisonleao/gruvbox.nvim.git" },
})

-- Default options:
require("gruvbox").setup({
	terminal_colors = false, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = true,
		folds = true,
	},
	strikethrough = true,
	invert_selection = true,
	invert_signs = false,
	invert_tabline = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = true,
})

vim.cmd("colorscheme gruvbox")

vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#666666" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "#343434", fg = "#ababab" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ababab" })
