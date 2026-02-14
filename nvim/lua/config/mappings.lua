vim.keymap.set("n", "<C-e>", function ()
    local cur_buf = vim.api.nvim_get_current_buf()
    local buf_name = vim.fn.bufname(cur_buf)

    if string.find(buf_name, "neo%-tree") then
        vim.cmd("wincmd w")
    else
        vim.cmd("Neotree focus")
    end
end)

vim.keymap.set("n", "ш", "i")

vim.keymap.set("n", "<C-S-e>", ":Neotree toggle<CR>")

vim.keymap.set("n", "<C-Left>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-Right>", ":wincmd l<CR>")
vim.keymap.set("n", "<C-Up>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-Down>", ":wincmd j<CR>")

vim.keymap.set("n", "<C-\\>", ":vsplit<CR>")
vim.keymap.set("n", "<C-S-\\>", ":split<CR>")

-- vim.keymap.set("n", "<C-`>", ":FloatermToggle<CR>")

vim.keymap.set("n", "<C-/>", ":CommentToggle<CR>")
vim.keymap.set("v", "<C-/>", ":CommentToggle<CR>")

vim.keymap.set("n", "<M-Left>", ":bprev<CR>")
vim.keymap.set("n", "<M-Right>", ":bnext<CR>")
vim.keymap.set("n", "<C-q>", ":bdelete<CR>")

vim.keymap.set("n", "<C-d>", ":lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<C-S-d>", ":lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<C-r>", ":lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<C-S-r>", ":lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<C-i>", ":lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "<C-Enter>", ":lua vim.diagnostic.open_float()<CR>")

vim.keymap.set("n", "<S-Enter>", function ()
    local filetype = vim.bo.filetype

    if filetype == "java" then
        vim.lsp.buf.format()
    else
        vim.cmd("Format")
    end
end)
