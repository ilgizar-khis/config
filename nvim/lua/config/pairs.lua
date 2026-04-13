vim.pack.add {
    { src = "https://github.com/nvim-mini/mini.pairs.git" }
}

require("mini.pairs").setup({
    modes = { insert = true, command = false, terminal = false },
    mappings = {
        -- open
        ["("] = { action = "open", pair = "()", neigh_pattern = "^[^\\]", },
        ["["] = { action = "open", pair = "[]", neigh_pattern = "^[^\\]", },
        ["{"] = { action = "open", pair = "{}", neigh_pattern = "^[^\\]", },

        -- close
        [")"] = { action = "close", pair = "()", neigh_pattern = "^[^\\]", },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "^[^\\]", },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "^[^\\]", },

        ["\""] = { action = "closeopen", pair = "\"\"", neigh_pattern = "^[^\\]", register = { cr = false } },
        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "^[^%a\\]", register = { cr = false } },
        ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "^[^\\]", register = { cr = false } },
    }
})
