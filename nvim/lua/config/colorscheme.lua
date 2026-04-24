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

vim.pack.add({ "https://github.com/thesimonho/kanagawa-paper.nvim.git" })
-- setup must be called before loading
require("kanagawa-paper").setup({
	-- enable undercurls for underlined text
	undercurl = true,
	-- transparent background
	transparent = true,
	-- highlight background for the left gutter
	gutter = false,
	-- background for diagnostic virtual text
	diag_background = true,
	-- dim inactive windows. Disabled when transparent
	dim_inactive = true,
	-- set colors for terminal buffers
	terminal_colors = true,
	-- cache highlights and colors for faster startup.
	-- see Cache section for more details.
	cache = false,

	styles = {
		-- style for comments
		comment = { italic = true },
		-- style for functions
		functions = { italic = false },
		-- style for keywords
		keyword = { italic = false, bold = false },
		-- style for statements
		statement = { italic = false, bold = false },
		-- style for types
		type = { italic = false },
	},
	-- override default palette and theme colors
	colors = {
		palette = {},
		theme = {
			ink = {},
			canvas = {},
		},
	},
	-- adjust overall color balance for each theme [-1, 1]
	color_balance = {
		ink = { brightness = 0, saturation = 0 },
		canvas = { brightness = 0, saturation = 0 },
	},
	-- override highlight groups
	overrides = function(colors)
		return {}
	end,

	-- uses lazy.nvim, if installed, to automatically enable needed plugins
	auto_plugins = true,
	-- enable highlights for all plugins (disabled if using lazy.nvim)
	all_plugins = package.loaded.lazy == nil,
	-- manually enable/disable individual plugins.
	-- check the `groups/plugins` directory for the exact names
	plugins = {
		-- examples:
		-- rainbow_delimiters = true
		-- which_key = false
	},
})

vim.cmd("colorscheme kanagawa-paper-ink")

vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
