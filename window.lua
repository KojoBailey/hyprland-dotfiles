local rgba = require("util").rgba

hl.config({
	general = {
		layout = "dwindle",

		gaps_in = 2,
		gaps_out = 0,

		border_size = 2,

		col = {
			active_border = rgba(255, 184, 208, 1),
			inactive_border = rgba(255, 184, 208, 0.1),
		},
	},

	decoration = {
		rounding = 0,
		rounding_power = 2.0,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		dim_inactive = false,

		blur = {
			enabled = true,
			size = 5,
			passes = 1,
			vibrancy = 0.1696,
		},

		shadow = {
			enabled = true,
			range = 4,
			render_power = 0,
			color = 0xFF000000,
		}
	}
})

-- Recommended by Hyprland devs.
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

-- Fixes some dragging issues with XWayland.
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},

	no_focus = true,
})
