vim.api.nvim_create_user_command("UpdatePacks", function()
	vim.pack.update()
end, {})
