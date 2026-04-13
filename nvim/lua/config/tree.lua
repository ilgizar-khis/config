vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
    filesystem = {
        window = {
            mappings = {
                ["l"] = "open",
                ["H"] = "set_root",
                ["."] = "toggle_hidden",
            }
        }
    }
})

vim.keymap.set("n", "<S-e>", "<CMD>Neotree toggle<CR>")
vim.keymap.set("n", "e", "<CMD>Neotree focus<CR>")
