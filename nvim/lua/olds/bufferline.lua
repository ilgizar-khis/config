return {
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					separator_style = "thick",
					always_show_bufferline = true,
					show_close_icon = false,
				},
			})
		end,
	},
}
