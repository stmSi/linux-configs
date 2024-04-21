local wezterm = require("wezterm")
local config = {}

local function with_base_theme(base_theme_name, overrides)
	local base_theme = wezterm.get_builtin_color_schemes()[base_theme_name]
	for k, v in pairs(overrides) do
		base_theme[k] = v
	end
	return base_theme
end

local custom_tokyo_night = with_base_theme("Tokyo Night", {
	-- Set the background to a darker shade
	background = "#0d0d11",
})

config.color_scheme = "custom_tokyo_night"
config.color_schemes = {
	["custom_tokyo_night"] = custom_tokyo_night,
}
config.font_size = 16.0

config.enable_scroll_bar = true
config.window_background_opacity = 0.92

config.text_background_opacity = 1.0
config.keys = {
	-- Move to the previous tab
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTabRelative = -1 }) }, -- Move to the next tab
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTabRelative = -1 }) }, -- Move to the next tab
	{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTabRelative = 1 }) },

	-- Custom key bindings for Alt+1 through Alt+8 to switch to tabs 1-8
	{ key = "1", mods = "CTRL", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "CTRL", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "CTRL", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "CTRL", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "CTRL", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "CTRL", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "CTRL", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "CTRL", action = wezterm.action({ ActivateTab = 7 }) },
	-- This binds "Alt+v" to split the screen vertically
	{ key = "v", mods = "ALT", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	-- This binds "Alt+h" to split the screen horizontally
	{ key = "h", mods = "ALT", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{
		key = "F2",
		mods = "NONE",
		action = wezterm.action({
			SendString = "tmuxdetach\n; pcd; tmuxdir\n",
		}),
	},
}
return config
