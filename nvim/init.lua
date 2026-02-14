require("config.lazy")
require("config.init")
require("config.mappings")
require("config.jdtls")
require("config.ui")

require("luasnip.loaders.from_vscode").lazy_load({
    paths = { vim.fn.stdpath("config") .. "/snips" }
})

vim.cmd("colorscheme my_scheme")
