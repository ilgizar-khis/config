vim.pack.add({
	{ src = "https://github.com/waiting-for-dev/ergoterm.nvim.git" },
})
local ergoterm = require("ergoterm")
ergoterm.setup({
	terminal_defaults = {
		layout = "float",
		float_opts = {
			height = 40,
			width = 160,
			border = "single",
			title = "",
			title_pos = "center",
		},
		float_winblend = 0,
		cleanup_on_success = false,
		auto_scroll = true,
	},
})

vim.keymap.set("n", "tt", function()
	term = ergoterm.get_all()
	if term[1] == nil then
		vim.cmd("TermNew<CR>")
	else
		term[1]:focus()
	end
end)

vim.keymap.set("t", "<ESC>", function()
	local term = ergoterm.get_focused()
	term:unfocus()
end)
