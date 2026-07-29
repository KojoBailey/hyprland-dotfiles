return {
	terminal = "kitty",
	fileManager = "dolphin",
	lockScreen = "quickshell -p ~/.config/quickshell/lockscreen.qml",

	cmdMenu = "rofi -show run",
	appMenu = "~/.config/rofi/launchers/type-7/launcher.sh",
	projectsMenu = "~/.config/rofi/applets/bin/projects.sh",

	screenshotAreaTool = "grim -g \"$(slurp)\" - | tee /tmp/latest_screenshot.png ~/Pictures/screenshots/$(date +%Y%m%d_%H:%M:%S).png | wl-copy && notify-send 'Screenshot taken' 'Saved to \"~/Pictures/screenshots\" and copied to clipboard.' -i /tmp/latest_screenshot.png -t 3000",
	screenshotScreenTool = "grim - | tee /tmp/latest_screenshot.png ~/Pictures/screenshots/$(date +%Y%m%d_%H:%M:%S).png | wl-copy && notify-send 'Screenshot taken' 'Saved to \"~/Pictures/screenshots\" and copied to clipboard.' -i /tmp/latest_screenshot.png -t 3000",
}
