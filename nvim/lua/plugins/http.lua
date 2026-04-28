vim.pack.add({
	"https://github.com/lima1909/resty.nvim.git",
	"https://github.com/nvim-lua/plenary.nvim.git",
})

require("resty").setup({})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "resty",
	callback = function()
		vim.schedule(function()
			vim.api.nvim_feedkeys("bp", "n", false)
		end)
	end,
})
