-- dwindle config
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- master config
hl.config({
	master = {
		new_status = "master",
		orientation = "left",
		mfact = 0.65,
	},
})

-- scrolling config
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
		column_width = 1,
		focus_fit_method = 1,
		direction = "right",
	},
})
