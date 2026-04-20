vim.pack.add({
	{ src = "https://github.com/akinsho/bufferline.nvim.git" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim.git" },
})

require("bufferline").setup({
	options = {
		mode = "buffers",
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = "slant",
		modified_icon = "●",
	},
	highlights = {
		fill = {
			fg = "#000000",
			bg = "#3C3836",
		},
		modified_visible = {
			fg = "#ABCDEF",
			bg = "#ABCDEF",
		},
		modified_selected = {
			fg = "#000000",
			bg = "#A89984",
			bold = true,
		},
		background = {
			fg = "#878787",
			bg = "#000000",
		},
		buffer_visible = {
			fg = "#FFFFFF",
			bg = "#000000",
		},
		buffer_selected = {
			fg = "#000000",
			bg = "#A89984",
			bold = true,
			italic = true,
		},
	},
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "|", right = "|" },
		disabled_filetypes = {
			statusline = {
				"neo-%tree",
			},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
