hl.config({
	input = {
		kb_layout = "gb",
		kb_options = "caps:escape",

		follow_mouse = 0,

		sensitivity = 0.0,

		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.1,
		},
	},

})

hl.device({
	name = "logitech-mx-anywhere-3s",
	sensitivity = -0.4,
	accel_profile = "flat",
	scroll_factor = 0.5,
})
