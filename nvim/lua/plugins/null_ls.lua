return {
  {
    "mhartington/formatter.nvim",
    config = true,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("formatter").setup {
        filetype = {
          python = {
            function()
              return {
                exe = "black",
                args = { "--quiet", "-" },
                stdin = true,
              }
            end,
          },
          lua = {
            function()
              return {
                exe = "stylua",
                args = { "-" },
                stdin = true,
              }
            end,
          },
          rust = {
            function()
              return {
                exe = "rustfmt",
                args = { "--emit=stdout" },
                stdin = true,
              }
            end,
          },
        },
      }
    end,
  },
}
