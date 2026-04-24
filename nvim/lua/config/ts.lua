-- Запускаем настройку после загрузки плагина
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		-- Устанавливаем нужные парсеры (список языков, которые ты используешь)
		require("nvim-treesitter").install({ "lua", "vim", "vimdoc", "python", "rust" })

		-- Включаем подсветку для всех открываемых файлов
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(args.match) or args.match
				pcall(vim.treesitter.start, args.buf, lang)
			end,
		})

		-- Включаем умные отступы на основе синтаксического дерева
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		-- Включаем сворачивание кода по синтаксису
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				vim.wo[args.buf].foldmethod = "expr"
				vim.wo[args.buf].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end,
		})
	end,
})
