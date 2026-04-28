vim.pack.add({ "https://github.com/nvim-mini/mini.completion.git" })

require("mini.completion").setup({
	mappings = {
		down = "<Tab>",
	},
	window = {
		info = { height = 25, width = 80, border = "single" },
		signature = { height = 25, width = 80, border = "single" },
	},
})
local imap_expr = function(lhs, rhs)
	vim.keymap.set("i", lhs, rhs, { expr = true })
end

imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
imap_expr("<CR>", [[pumvisible() ? "\<C-y>" : "\<CR>"]])

vim.api.nvim_set_hl(0, "MiniCompletionActiveParameter", { bg = "#ababab", fg = "#000000" })
