local globals = require("globals")

local mainMod = "SUPER" -- Windows key

function create_keybind(...)
	return table.concat({...}, " + ")
end

-- # Top Row
local volumeUp       = hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true })
local volumeDown     = hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true })
local volumeMute     = hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
local micMute        = hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
local brightnessUp   = hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%+"),
	{ locked = true, repeating = true })
local brightnessDown = hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%-"),
	{ locked = true, repeating = true })

-- # Account
local logoutCmd = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
local logout = hl.bind(create_keybind(mainMod, "M"), hl.dsp.exec_cmd(logoutCmd))
	:set_enabled(false)

-- # Launching Apps
local launchAppMenu        = hl.bind(create_keybind(mainMod, "A"),     hl.dsp.exec_cmd(globals.appMenu))
local launchCmdMenu        = hl.bind(create_keybind(mainMod, "R"),     hl.dsp.exec_cmd(globals.cmdMenu))
local launchTerminal       = hl.bind(create_keybind(mainMod, "Q"),     hl.dsp.exec_cmd(globals.terminal))
local launchProjecs        = hl.bind(create_keybind(mainMod, "P"),     hl.dsp.exec_cmd(globals.projectsTerminal))
local launchFileManager    = hl.bind(create_keybind(mainMod, "E"),     hl.dsp.exec_cmd(globals.fileManager))
local screenshotAreaBind   = hl.bind(create_keybind("Print"),          hl.dsp.exec_cmd(globals.screenshotAreaTool))
local screenshotScreenBind = hl.bind(create_keybind("SHIFT", "Print"), hl.dsp.exec_cmd(globals.screenshotScreenTool))

-- # Window Control
local closeWindow        = hl.bind(create_keybind(mainMod, "W"),         hl.dsp.window.close())
local makeWindowFloating = hl.bind(create_keybind(mainMod, "F"),         hl.dsp.window.float())
local moveWindow         = hl.bind(create_keybind(mainMod, "mouse:272"), hl.dsp.window.drag())
local resizeWindow       = hl.bind(create_keybind(mainMod, "mouse:273"), hl.dsp.window.resize())

-- # Window Focus
local moveFocusLeft = hl.bind(create_keybind(mainMod, "left"),  hl.dsp.focus({ direction = "left" }))
local moveFocusLeft = hl.bind(create_keybind(mainMod, "right"), hl.dsp.focus({ direction = "right" }))
local moveFocusLeft = hl.bind(create_keybind(mainMod, "up"),    hl.dsp.focus({ direction = "up" }))
local moveFocusLeft = hl.bind(create_keybind(mainMod, "down"),  hl.dsp.focus({ direction = "down" }))

-- # Workspaces
for i = 1, 10 do
	local key = i % 10 -- 10 maps to 0
	local switchToWorkspace = hl.bind(create_keybind(mainMod, key),          hl.dsp.focus({ workspace = i }))
	local moveToWorkspace   = hl.bind(create_keybind(mainMod, "SHIFT", key), hl.dsp.window.move({ workspace = i }))
end

-- # Special Workspaces
-- Obsidian
hl.bind(create_keybind(mainMod, "O"), hl.dsp.focus({ workspace = "name:obsidian" }))
hl.bind(create_keybind(mainMod, "SHIFT", "O"), hl.dsp.window.move({ workspace = "name:obsidian" }))
-- Claude
hl.bind(create_keybind(mainMod, "C"), hl.dsp.focus({ workspace = "name:claude" }))
hl.bind(create_keybind(mainMod, "SHIFT", "C"), hl.dsp.window.move({ workspace = "name:claude" }))
-- Discord
hl.bind(create_keybind(mainMod, "D"), hl.dsp.focus({ workspace = "name:discord" }))
hl.bind(create_keybind(mainMod, "SHIFT", "D"), hl.dsp.window.move({ workspace = "name:discord" }))
-- Browser
hl.bind(create_keybind(mainMod, "B"), hl.dsp.focus({ workspace = "name:browser" }))
hl.bind(create_keybind(mainMod, "SHIFT", "B"), hl.dsp.window.move({ workspace = "name:browser" }))
