local wezterm = require 'wezterm';
local config = {}

config.color_scheme = 'Tokyo Night'
config.font_size = 16.0
config.font =  wezterm.font 'Berkeley Mono'
config.enable_scroll_bar = true
config.window_background_opacity = 1.90
config.text_background_opacity = 1.0
config.keys = {
  -- Move to the previous tab
  {key="LeftArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}}
  -- Move to the next tab
, {key="RightArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=1}}
}
return config
