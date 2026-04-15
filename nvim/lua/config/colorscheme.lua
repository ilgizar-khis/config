vim.pack.add { 
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    { src = "https://github.com/rebelot/kanagawa.nvim.git" },
    { src = "https://github.com/ellisonleao/gruvbox.nvim.git" },
}

-- Default options:
require("gruvbox").setup({
  terminal_colors = false, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = true,
    folds = true,
  },
  strikethrough = true,
  invert_selection = true,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true ,
})


require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "dragon",              -- Load "wave" theme
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme gruvbox")
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#111111" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#ffffff" })
