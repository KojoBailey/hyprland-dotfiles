return {
	cmdMenu = "rofi -show run",
	appMenu = "rofi -show drun",
	terminal = "kitty",
	projectsTerminal = 'kitty --working-directory ~/Projects zsh -c \'TS="+%Y %b %d %H:%M"; echo "\\e[1;31m[ Projects ]\\e[0m"; eza -l --icons --hyperlink --no-permissions --no-user --no-filesize --time-style=$TS --sort=modified --reverse; echo "\n\\e[3;37m// Inactive\\e[0m"; eza .inactive -la --icons --hyperlink --no-permissions --no-user --no-filesize --time-style=$TS --sort=modified --reverse; exec zsh\'',
	fileManager = "dolphin",
	screenshotTool = "grim -g \"$(slurp)\" - | wl-copy",
}
