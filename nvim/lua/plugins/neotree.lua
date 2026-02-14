return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		opts = {
			window = {
				width = 30,
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
					["p"] = { "toggle_preview", config = { use_float = true } },
				},
			},
			filesystem = {
                group_empty_dirs = true,
                scan_mode = "deep",
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
		},
	},
}
