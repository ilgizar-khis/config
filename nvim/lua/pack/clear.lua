function ClearPacks(opts)
	-- create a new buffer
	local buffer = vim.api.nvim_create_buf(false, true)
	-- window parametrs
	local width = 100
	local height = 30
	local col = math.floor((vim.api.nvim_get_option("columns") - width) / 2)
	local row = math.floor((vim.api.nvim_get_option("lines") - height) / 2)

	--create new window
	local win = vim.api.nvim_open_win(buffer, true, {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		border = "single",
	})

	-- introduction
	local prompt = {
		"<Space> for toggle [+] and [ ]",
		"<CR> for confirm",
		"<ESC> for cancel",
		"[+] = marked for deletion",
		"",
	}
	vim.api.nvim_buf_set_lines(buffer, 0, -1, false, prompt)
	vim.api.nvim_win_set_cursor(win, { #prompt, 0 })
	local output = {}

	-- create disabled plugins list
	for _, package in ipairs(vim.pack.get()) do
		if not package.active then
			local line = "[+] " .. package.spec.name
			table.insert(output, line)
			local src = "\tsrc = " .. package.spec.src
			table.insert(output, src)
		end
	end

	-- if list of plugins is empty we create text "Empty"
	if #output > 0 then
		vim.api.nvim_buf_set_lines(buffer, #prompt, -1, false, output)
	else
		vim.api.nvim_buf_set_lines(buffer, #prompt, -1, false, { "Empty" })
	end

	-- close window (or just :q)
	vim.keymap.set("n", "<ESC>", function()
		vim.api.nvim_win_close(win, true)
	end, { buffer = buffer })

	-- delete all marked as [+] plugins from vim.pack
	vim.keymap.set("n", "<CR>", function()
		local lines = vim.api.nvim_buf_get_lines(buffer, #prompt, -1, false)
		local packs = {}

		-- get all lines with [+]
		for _, line in ipairs(lines) do
			if string.find(line, "^[+]") then
				local str = string.gsub(line, "%[%+%] ", "")
				table.insert(packs, str)
			end
		end

		-- delete all packs ans close window
		vim.pack.del(packs)
		vim.api.nvim_win_close(win, true)
	end, { buffer = buffer })

	-- toggle [+]/[ ] mark
	vim.keymap.set("n", "<Space>", function()
		-- get current line number
		local line_nr = vim.api.nvim_win_get_cursor(0)[1]

		-- check region of buffer
		if line_nr > #prompt then
			-- get selected lines
			local lines = vim.api.nvim_buf_get_lines(buffer, line_nr - 2, line_nr, false)
			local line = lines[2]

			-- if selected line start on "^\tsrc = " select prev line
			if string.find(lines[2], "^\tsrc = ") then
				line_nr = line_nr - 1
				line = lines[1]
			end

			-- check line is exists and output is exists
			if line ~= nil and #output > 0 then
				-- replace [+] to [ ]
				if string.find(line, "[+]") then
					line = string.gsub(line, "%[%+%]", "[ ]")
				-- replace [ ] to [+]
				elseif string.find(line, "[ ]") then
					line = string.gsub(line, "%[ %]", "[+]")
				end
				-- set selected line of buffer
				vim.api.nvim_buf_set_lines(buffer, line_nr - 1, line_nr, false, { line })
			end
		end
	end, { buffer = buffer })

	-- -- bind 'k' for upward movement, leave arrow keys at default
	vim.keymap.set("n", "k", function()
		local line_nr = vim.api.nvim_win_get_cursor(0)[1]

		if line_nr > #prompt then
			vim.cmd.normal("-1")
		end
	end, { buffer = buffer })
end

-- create user command
vim.api.nvim_create_user_command("ClearPacks", function(opts)
	ClearPacks(opts)
end, { nargs = "*" })
