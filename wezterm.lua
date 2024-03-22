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
, {key="RightArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=1}},
  -- Custom key bindings for Alt+1 through Alt+8 to switch to tabs 1-8
  {key="1", mods="CTRL", action=wezterm.action{ActivateTab=0}},
  {key="2", mods="CTRL", action=wezterm.action{ActivateTab=1}},
  {key="3", mods="CTRL", action=wezterm.action{ActivateTab=2}},
  {key="4", mods="CTRL", action=wezterm.action{ActivateTab=3}},
  {key="5", mods="CTRL", action=wezterm.action{ActivateTab=4}},
  {key="6", mods="CTRL", action=wezterm.action{ActivateTab=5}},
  {key="7", mods="CTRL", action=wezterm.action{ActivateTab=6}},
  {key="8", mods="CTRL", action=wezterm.action{ActivateTab=7}},
  -- This binds "Alt+v" to split the screen vertically
  {key="v", mods="ALT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  -- This binds "Alt+h" to split the screen horizontally
  {key="h", mods="ALT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
}
return config
