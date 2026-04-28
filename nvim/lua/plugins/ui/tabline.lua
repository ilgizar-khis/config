vim.pack.add({
	{ src = "https://github.com/akinsho/bufferline.nvim.git" },
})

require("bufferline").setup({
	options = {
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = "slant",
		modified_icon = "●",
	},
	highlights = {
		fill = {
			bg = "#000000",
		},
		background = {
			bg = "#000000",
		},
		buffer_selected = {
			bg = "#343434",
			bold = true,
		},
	},
})
