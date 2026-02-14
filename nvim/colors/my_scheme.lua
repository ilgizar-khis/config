vim.cmd "hi clear"
vim.cmd "syntax reset"

vim.g.colors_name = "my_theme"

local function hlg(group, color)
  local opts = { fg = color.fg, bg = color.bg, italic = color.italic, bold = color.bold }
  vim.api.nvim_set_hl(0, group, opts)
end

hlg("Normal", { fg = "#abcabc", bg = "none" })
hlg("NormalFloat", { bg = "none" })
hlg("Terminal", { bg = "none" })
hlg("Comment", { fg = "#ababab", italic = true })
hlg("Keyword", { fg = "#cba6f7", bold = true })
hlg("String", { fg = "#a6e3a1" })
hlg("Type", { fg = "#f9e2af" })

hlg("StatusLine", { fg = "#ffffff", bg = "#343434"})
hlg("StatusLineNC", { fg = "#ababab", bg = "#000000" }) --неактивное окно
hlg("StatusLineTerm", { fg = "#ffffff", bg = "#000000" })
hlg("StatusLineTermNC", { fg = "#ababab", bg = "#000000" })

hlg("TabLineFill", { fg = "#343434", bg = "#343434"})
hlg("TabLine", { fg = "#ababab", bg = "#343434"})
hlg("TabLineSel", { fg = "#ffffff", bg = "#999999"})

hlg("@keyword", {fg = "#cba6f7", bold=true})
hlg("@string", {fg = "#a6e3a1"})
hlg("@type", {fg = "#f9e2af"})

print([[my_theme загружен]])

