hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = 1.2,
	transform = 0,
})
hl.monitor({
	output = "HDMI-A-2",
	mode = "preferred",
	position = "auto",
	scale = 1.0,
	transform = 0,
})

-- Fixes pixelated apps.
hl.config({ xwayland = { force_zero_scaling = true } })
hl.env("GDK_SCALE", 1.5)
hl.env("QT_SCALE_FACTOR", 1.0)
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.on("monitor.added", function(addedMonitor)
	hl.notification.create({
		text = "Connected monitor: " .. addedMonitor.name,
		timeout = 4000,
		icon = "ok"
	})
	-- BUG: Only swaps one workspace? Should swap all.
	-- hl.dispatch(hl.dsp.workspace.swap_monitors({ monitor1 = "eDP-1", monitor2 = addedMonitor }))
end)
