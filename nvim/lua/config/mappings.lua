vim.keymap.set("n", "e", function()
	local cur_buf = vim.api.nvim_get_current_buf()
	local buf_name = vim.fn.bufname(cur_buf)

	if string.find(buf_name, "neo%-tree") then
		vim.cmd("colorscheme retrobox")
		vim.cmd("wincmd w")
	else
		vim.cmd("Neotree reveal_file=%")
	end
end)

vim.keymap.set("n", "<S-e>", ":Neotree toggle<CR>")

vim.keymap.set("n", "tt", "<cmd>ToggleTerm<CR>", { desc = "open terminal" })
vim.keymap.set("t", "<esc>", "<cmd>ToggleTerm<CR>", { desc = "close terminal" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")

vim.keymap.set("n", "\\", ":vsplit<CR>")
vim.keymap.set("n", "<S-\\>", ":vsplit<CR>")

vim.keymap.set("n", "<PageDown>", "<C-e>")
vim.keymap.set("n", "<PageUp>", "<C-y>")

vim.keymap.set("i", "<PageDown>", "<C-o><C-e>")
vim.keymap.set("i", "<PageUp>", "<C-o><C-y>")

vim.keymap.set("n", "tc", ":CommentToggle<CR>")
vim.keymap.set("v", "tc", ":CommentToggle<CR>")

vim.keymap.set("n", "<M-h>", ":bprev<CR>")
vim.keymap.set("n", "<M-l>", ":bnext<CR>")

vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "g<S-d>", ":lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "g<S-r>", ":lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "<Enter>", ":lua vim.diagnostic.open_float()<CR>")

vim.keymap.set("n", "<S-Enter>", function()
	local filetype = vim.bo.filetype

	if filetype == "java" then
		vim.lsp.buf.format()
	else
		vim.cmd("Format")
	end
end)
