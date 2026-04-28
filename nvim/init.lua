vim.opt.cmdheight = 0

vim.opt.showtabline = 2
vim.opt.laststatus = 3
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
-- require("vim._core.ui2").enable({})
vim.opt.tabstop = 4
vim.opt.scrolloff = 3
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.colorcolumn = "80"

vim.keymap.set("n", "<M-h>", "<CMD>bprev<CR>")
vim.keymap.set("n", "<M-l>", "<CMD>bnext<CR>")

vim.keymap.set("n", "<C-h>", "<CMD>wincmd h<CR>")
vim.keymap.set("n", "<C-l>", "<CMD>wincmd l<CR>")
vim.keymap.set("n", "<C-j>", "<CMD>wincmd j<CR>")
vim.keymap.set("n", "<C-k>", "<CMD>wincmd k<CR>")
vim.keymap.set("n", "<Tab>", "<CMD>wincmd w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<CMD>wincmd W<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "\\", "<CMD>vsplit<CR>")
vim.keymap.set("n", "|", "<CMD>split<CR>")

require("plugins.ui.filemanager")
require("plugins.ui.terminal")
require("plugins.ui.statusline")
require("plugins.ui.tabline")
require("plugins.ui.telescope")
require("plugins.ui.colorscheme")

require("plugins.http")
require("plugins.code.lsp")
require("plugins.code.pairs")
require("plugins.git")
require("plugins.code.jdtls")
require("plugins.code.surround")
require("plugins.code.formatter")
require("plugins.code.image")
require("plugins.code.markdown")
require("plugins.code.colorizer")

require("pack.clear")
require("pack.update")
