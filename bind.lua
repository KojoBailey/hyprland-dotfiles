local globals = require("globals")

local mainMod = "SUPER" -- Windows key

function create_keybind(...)
	return table.concat({...}, " + ")
end

--[[ Top Row ]]
-- volume up
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true })
-- volume down
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true })
-- volume mute
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
-- mic mute
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
	:set_enabled(false)
-- brightness up
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%+"),
	{ locked = true, repeating = true })
-- brightness down
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%-"),
	{ locked = true, repeating = true })

--[[ Account ]]
local logoutCmd = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
-- logout
hl.bind(create_keybind(mainMod, "M"), hl.dsp.exec_cmd(logoutCmd))
	:set_enabled(false)
-- lock screen
hl.bind("XF86Favorites", hl.dsp.exec_cmd(globals.lockScreen))

--[[ Launching Apps ]]
-- launch app menu
hl.bind(create_keybind(mainMod, "A"),     hl.dsp.exec_cmd(globals.appMenu))
-- launch projects menu
hl.bind(create_keybind(mainMod, "P"),     hl.dsp.exec_cmd(globals.projectsMenu))
-- launch config (options) menu
hl.bind(create_keybind(mainMod, "O"),     hl.dsp.exec_cmd(globals.configMenu))
-- launch command menu
hl.bind(create_keybind(mainMod, "R"),     hl.dsp.exec_cmd(globals.cmdMenu))
-- lauch terminal
hl.bind(create_keybind(mainMod, "Q"),     hl.dsp.exec_cmd(globals.terminal))
-- launch file manager
hl.bind(create_keybind(mainMod, "E"),     hl.dsp.exec_cmd(globals.fileManager))
-- screenshot selected area
hl.bind(create_keybind("Print"),          hl.dsp.exec_cmd(globals.screenshotAreaTool))
-- screenshot entire screen
hl.bind(create_keybind("SHIFT", "Print"), hl.dsp.exec_cmd(globals.screenshotScreenTool))

--[[ Window Control ]]
-- close window
hl.bind(create_keybind(mainMod, "W"),         hl.dsp.window.close())
-- make window floating
hl.bind(create_keybind(mainMod, "F"),         hl.dsp.window.float())
-- move window
hl.bind(create_keybind(mainMod, "mouse:272"), hl.dsp.window.drag())
-- resize window
hl.bind(create_keybind(mainMod, "mouse:273"), hl.dsp.window.resize())

--[[ Window Focus ]]
-- shift window focus left
hl.bind(create_keybind(mainMod, "left"),  hl.dsp.focus({ direction = "left" }))
-- shift window focus right
hl.bind(create_keybind(mainMod, "right"), hl.dsp.focus({ direction = "right" }))
-- shift window focus up
hl.bind(create_keybind(mainMod, "up"),    hl.dsp.focus({ direction = "up" }))
-- shift window focus down
hl.bind(create_keybind(mainMod, "down"),  hl.dsp.focus({ direction = "down" }))

--[[ Workspaces ]]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to 0
	-- switch to workspace
	hl.bind(create_keybind(mainMod, key),          hl.dsp.focus({ workspace = i }))
	-- move to worksapce
	hl.bind(create_keybind(mainMod, "SHIFT", key), hl.dsp.window.move({ workspace = i }))
end

--[[ Named Workspaces ]]
local workspaceBinds = {
	browser = "B",
	notes = "N",
	messenger = "M",
	llm = "L",
}
for name, bind in pairs(workspaceBinds) do
	hl.bind(create_keybind(mainMod, bind), hl.dsp.focus({ workspace = "name:" .. name }))
	hl.bind(create_keybind(mainMod, "SHIFT", bind), hl.dsp.window.move({ workspace = "name:" .. name }))
end
