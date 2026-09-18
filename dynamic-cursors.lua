-- https://github.com/VirtCode/hypr-dynamic-cursors
if hl.plugin.dynamic_cursors ~= nil then
	hl.config { plugin = { dynamic_cursors = {
		mode = "stretch",
		shake = {
			enabled = false,
		},
	}}}
else
	hl.notification.create({
		text = "hypr-dynamic-cursors was not loaded.",
		timeout = 5000,
		icon = "err",
	})
end
