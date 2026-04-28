vim.pack.add({ "https://github.com/nvim-mini/mini.statusline.git" })

local MiniStatusline = require("mini.statusline")
MiniStatusline.setup({})

local normal_hl = { bg = "none", fg = "#ffffff", bold = true }
local insert_hl = { bg = "none", fg = "#ffccaa", bold = true }
local visual_hl = { bg = "none", fg = "#aaccff", bold = true }
local other_hl = { bg = "none", fg = "#888899" }
local command_hl = { bg = "none", fg = "#ccffaa", bold = true }
local replace_hl = { bg = "none", fg = "#ffffaa", bold = true }

vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", normal_hl)
vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", insert_hl)
vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", visual_hl)
vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", replace_hl)
vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", command_hl)
vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", other_hl)

vim.api.nvim_set_hl(0, "MiniStatuslineFilename", other_hl)
