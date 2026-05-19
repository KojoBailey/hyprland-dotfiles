hl.config({ general = { locale = "en_GB" } })

require("monitor")
require("cursor")
require("window")
require("animation")
require("input")
require("bind")

hl.on("hyprland.start", function ()
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,pkcs11,ssh")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("fcitx5 -d")
	hl.exec_cmd("quickshell")
	hl.exec_cmd("hyprpaper")
end)

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GNOME_KEYRING_CONTROL", "/run/user/1000/keyring")
hl.env("GTK_IM_MsODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")

hl.config({ misc = {
	force_default_wallpaper = 0,
	disable_hyprland_logo = true
}})
