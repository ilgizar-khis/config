return {
	"nvzone/floaterm",
	dependencies = "nvzone/volt",
	opts = {
		border = false,
		size = { h = 80, w = 80 },

		-- to use, make this func(buf)
		mappings = {
			sidebar = nil,
			term = function()
				vim.keymap.set("t", "<M-Left>", function()
					require("floaterm.api").cycle_term_bufs("prev")
				end, { buffer = buf })

				vim.keymap.set("t", "<M-Right>", function()
					require("floaterm.api").cycle_term_bufs("next")
				end, { buffer = buf })

				vim.keymap.set("t", "<C-n>", function()
					require("floaterm.api").new_term()
				end, { buffer = buf })

				vim.keymap.set("t", "<C-S-n>", function()
					require("floaterm.api").delete_term()
				end, { buffer = buf })
			end,
		},

		-- Default sets of terminals you'd like to open
		terminals = {
			{ name = "Terminal" },
			-- cmd can be function too
		},
	},
	cmd = "FloatermToggle",
}
