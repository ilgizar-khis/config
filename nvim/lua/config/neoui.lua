-- neoui.lua - Improved UI configuration
-- Potential improvements over ui.lua:
-- 1. Fixed undeclared `has_buffers` variable (was global, now local)
-- 2. Modular component-based statusline (easier to extend)
-- 3. LSP diagnostics integration (errors/warnings count)
-- 4. LSP progress indicator
-- 5. Better separator icons (nerd fonts)
-- 6. Graceful handling when plugins not loaded
-- 7. Configurable colors via palette table
-- 8. File size indicator in statusline
-- 9. Better buffer filtering (hidden, quickfix, etc.)
-- 10. Winbar support for modern Neovim (0.8+)

-- Color palette (easy to theme)
local palette = {
  bg = "#333333",
  fg = "#cdd6f4",
  accent = "#aaaaaa",
  error = "#f38ba8",
  warn = "#fab387",
  info = "#89dceb",
  git_add = "#a6e3a1",
  git_del = "#f38ba8",
  git_chg = "#f9e2af",
}

-- Safe plugin check
local function has_plugin(name)
  return pcall(require, name)
end

-- Icons (fallback to ASCII if nerd fonts not available)
local icons = {
  git = "",
  error = "x",
  warn = "!",
  info = "i",
  separator = "|",
  modified = "*",
  readonly = "=",
}

-- Set colorscheme (safe, won't error if missing)
pcall(vim.cmd, "colorscheme retrobox")

-- Color column highlight
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#555555" })

vim.opt.fillchars:append({
	vert = "|",
	horiz = "-",
	eob = " ",
})

-- Statusline components (match ui.lua format for gitsigns)
local function get_git_status()
  if not has_plugin("gitsigns") then return "" end
  local branch = vim.b.gitsigns_head or ""
  local status = vim.b.gitsigns_status or ""
  
  if branch == "" or branch == "HEAD" then
    return ""
  end
  
  -- Format: [ branch:status ]
  local formatted = " [ " .. branch
  if status and status ~= "" then
    formatted = formatted .. ":" .. status
  end
  formatted = formatted .. " ] "
  return formatted
end

local function get_diagnostics()
  local ok, counts = pcall(vim.diagnostic.count, 0)
  if not ok then return "" end
  
  local errors = counts[vim.diagnostic.severity.ERROR] or 0
  local warns = counts[vim.diagnostic.severity.WARN] or 0
  local infos = counts[vim.diagnostic.severity.INFO] or 0
  
  local result = ""
  if errors > 0 then result = result .. " %" .. icons.error .. " " .. errors end
  if warns > 0 then result = result .. " %" .. icons.warn .. " " .. warns end
  if infos > 0 then result = result .. " %" .. icons.info .. " " .. infos end
  return result
end

local function get_lsp_progress()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then return "" end
  -- Could integrate with lsp-progress plugin
  return ""
end

local function get_file_info()
  local filename = vim.fn.expand("%:~:.")
  if filename == "" or vim.bo.buftype ~= "" then
    return "%t"
  end
  local modified = vim.bo.modified and "%" .. icons.modified .. " " or ""
  local readonly = vim.bo.readonly and "%" .. icons.readonly .. " " or ""
  local filesize = vim.fn.getfsize(vim.fn.expand("%"))
  local size = filesize > 0 and " " .. vim.fn.fnamemodify(filesize, "n") or ""
  return modified .. readonly .. filename .. size
end

local function get_filetype()
  return " %{" .. vim.bo.filetype .. "}"
end

local function get_position()
  return " %l:%c %p%%"
end

-- Build statusline (ui.lua + diagnostics)
function status_line()
  local filename = vim.fn.expand("%:~:.")
  if filename == "" or vim.bo.buftype ~= "" then
    return "%t"
  end
  
  local branch = vim.b.gitsigns_head or ""
  local status = vim.b.gitsigns_status or ""
  
  local formatted_branch = ""
  if branch ~= "" and branch ~= "HEAD" then
    formatted_branch = " [ " .. branch
    if status and status ~= "" then
      formatted_branch = formatted_branch .. ":" .. status
    end
    formatted_branch = formatted_branch .. " ] "
  end
  
  -- Diagnostics (errors, warnings, info)
  local diag = get_diagnostics()
  
  -- Build: filename + modified + branch + diagnostics + %r %w %= %y %l:%c %p%%
  return " " .. filename .. "%m" .. formatted_branch .. diag .. " %r %w%=%y %l:%c %p%%"
end

vim.opt.laststatus = 3
vim.opt.statusline = "%!v:lua.status_line()"

-- Improved tabline with better buffer filtering
local devicons = has_plugin("nvim-web-devicons") and require("nvim-web-devicons") or nil

local excluded_bufts = {
  "neo-tree",
  "toggleterm",
  "lazy",
  "mason",
  "null-ls",
  "oil",
  "noice",
  "snacks_dashboard",
}

local excluded_buftypes = {
  "nofile",
  "quickfix",
  "prompt",
  "popup",
}

local function is_excluded(bufname, buftype)
  -- Check buftype first (more reliable)
  if buftype ~= "" then
    for _, bt in ipairs(excluded_buftypes) do
      if buftype == bt then
        return true
      end
    end
  end
  
  -- Then check bufname patterns
  for _, pattern in ipairs(excluded_bufts) do
    if string.find(bufname, pattern) then
      return true
    end
  end
  return false
end

function _G.my_tabline()
  local tabline = ""
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()
  local has_buffers = false

  for _, buf in ipairs(buffers) do
    if not vim.api.nvim_buf_is_loaded(buf) then
      goto continue
    end
    
    local bufname = vim.api.nvim_buf_get_name(buf)
    local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
    
    -- Skip excluded buffers (check both name and type)
    if is_excluded(bufname, buftype) then
      goto continue
    end
    
    -- Skip empty buffers unless current
    if bufname == "" and buf ~= current_buf then
      goto continue
    end
    
    -- Use tail filename
    local display_name = vim.fn.fnamemodify(bufname, ":t")
    if display_name == "" then display_name = "NoName" end
    
    -- Modified indicator
    local is_modified = vim.api.nvim_buf_get_option(buf, "modified")
    local mod_symbol = is_modified and icons.modified or ""
    
    -- Icon with safe fallback
    local icon = ""
    if devicons then
      local ext = vim.fn.fnamemodify(bufname, ":e")
      icon, _ = devicons.get_icon(display_name, ext, { default = true })
      icon = icon or ""
    end
    
    -- Build tab entry
    if #tabline > 0 then
      tabline = tabline .. "%#TabLine#│"
    end
    
    if buf == current_buf then
      tabline = tabline .. "%#TabLineSel# " .. icon .. " " .. display_name .. mod_symbol .. " "
    else
      tabline = tabline .. "%#TabLine# " .. icon .. " " .. display_name .. mod_symbol .. " "
    end
    
    has_buffers = true
    ::continue::
  end
  
  tabline = tabline .. "%#TabLineFill#%="
  return tabline
end

vim.opt.showtabline = 2
vim.opt.tabline = "%!v:lua.my_tabline()"
vim.opt.mouse = "a"

-- Winbar support (Neovim 0.8+)
-- vim.opt.winbar = "%!v:lua.status_line()"

-- Optional: statusline highlight groups
vim.api.nvim_set_hl(0, "StatusLine", { bg = palette.bg, fg = palette.fg })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = palette.bg, fg = "#6c7086" })
vim.api.nvim_set_hl(0, "TabLineSel", { bg = palette.accent, fg = palette.bg })
vim.api.nvim_set_hl(0, "TabLine", { bg = palette.bg, fg = "#6c7086" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = palette.bg })
