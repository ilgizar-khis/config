return {
  -- Markdown support with treesitter and preview
  {
    "MeanderingProgrammer/markdown.nvim",
    ft = "markdown",
    opts = {
      preview = {
        enabled = true,
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Better markdown editing experience
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  -- Treesitter markdown parser
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "markdown", "markdown_inline" },
    },
  },
}
