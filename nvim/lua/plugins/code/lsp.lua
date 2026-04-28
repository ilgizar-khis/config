vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
})
vim.pack.add({ "https://github.com/saghen/blink.lib" })
-- vim.opt.completeopt = { "menuone", "noselect", "popup", "fuzzy" }

vim.lsp.document_color.enable()

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "pyright" },
})

require("nvim-treesitter").setup({
	lazy = true,
	build = ":TSUpdate",
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")

vim.treesitter.language.add("markdown")
