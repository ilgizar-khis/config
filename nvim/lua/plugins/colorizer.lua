return {
	{ -- lazy.nvim
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			suppress_deprecation = true,
			parsers = {
				css = true, -- preset: enables names, hex, rgb, hsl, oklch
				tailwind = { enable = true },
			},
			display = {
				mode = "virtualtext",
				virtualtext = { position = "after" },
			},
		},
	},
}
