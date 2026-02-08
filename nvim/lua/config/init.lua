vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = true
-- vim.opt.guicursor = "n-v-c-i-t:ver100"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.cmd("colorscheme gruvbox")
-- vim.cmd("Neotree close")

vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#565656' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#343434' })

