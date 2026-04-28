vim.pack.add({
	"https://github.com/3rd/image.nvim.git",
})

require("image").setup({
	backend = "kitty", -- or "ueberzug" or "sixel"
	processor = "magick_cli", -- or "magick_rock"
	integrations = {
		markdown = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			only_render_image_at_cursor_mode = "popup", -- or "inline"
			floating_windows = false, -- if true, images will be rendered in floating markdown windows
			filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
		},
		asciidoc = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			only_render_image_at_cursor_mode = "popup",
			floating_windows = false,
			filetypes = { "asciidoc", "adoc" },
		},
		neorg = {
			enabled = true,
			filetypes = { "norg" },
		},
		rst = {
			enabled = true,
		},
		typst = {
			enabled = true,
			filetypes = { "typst" },
		},
		html = {
			enabled = false,
		},
		css = {
			enabled = false,
		},
	},
	max_width = nil,
	max_height = nil,
	max_width_window_percentage = nil,
	max_height_window_percentage = 50,
	scale_factor = 1.0,
	window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
	window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
	editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
	tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
	hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})

vim.pack.add({
	"https://github.com/hmdfrds/focal.nvim.git",
})
require("focal").setup({
	-- Runtime toggle
	enabled = true,

	-- Window appearance
	border = "single", -- border style (any valid nvim_open_win border)
	winblend = 0, -- transparency (0-100)
	zindex = 100, -- float stacking order
	title = true, -- show filename in border

	-- Size constraints (in terminal cells)
	min_width = 10,
	min_height = 5,
	max_width = 80,
	max_height = 40,
	max_width_percent = 50, -- max width as % of editor
	max_height_percent = 50, -- max height as % of editor

	-- Performance
	max_file_size_mb = 0.5, -- skip files larger than this
	debounce_ms = 0, -- additional delay after CursorHold (0 = use updatetime)

	-- Position
	col_offset = 4, -- horizontal gap from cursor
	row_offset = 1, -- vertical gap from cursor

	-- Renderer override
	backend = "image.nvim", -- nil/"auto" = auto, "image.nvim", or "chafa"

	-- Extension whitelist (nil = all renderer-declared extensions)
	extensions = nil, -- e.g., { "png", "jpg" } to restrict

	-- Chafa-specific options
	chafa = {
		format = "symbols", -- chafa --format flag
		color_space = nil, -- nil = auto, "rgb", "din99d"
		animate = false, -- allow GIF animation
		max_output_bytes = 1048576, -- stdout cap (1MB)
	},

	-- Render timeout (ms). Auto-hides if render takes too long.
	render_timeout_ms = 10000,

	-- Lifecycle hooks
	on_show = nil, -- fun(path: string, renderer: string)
	on_hide = nil, -- fun()
})
