require("bind")

hl.config({
	plugin = {
		hyprexpo = {
			columns = 3,
			rows = 3,
			skip_empty = 1,
			dynamic_grid = 1,
			gaps_in = 5,
			gaps_out = 0,
			bg_col = "rgb(000000)",
			workspace_method = "center current",
			gesture_distance = 200,
			cancel_key = "escape",
			show_cursor = 1,
			show_pinned_windows = 0,
			drag_drop_enable = 1,

			keynav_enable = 1,
			number_key_mode = "index",
			label_enable = 1,
		},
	},
})

hl.bind(create_keybind(mainMod, "S"), function()
	hl.plugin.hyprexpo.expo("toggle")
end)
