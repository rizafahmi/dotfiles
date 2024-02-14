local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- config.color_scheme = 'Ayu Mirage (Gogh)'
config.color_scheme = 'ChallengerDeep'
config.font = wezterm.font("Monaspace Neon", { weight = "Medium", italic = false })
config.font_size = 22
config.line_height = 1.2

config.window_background_opacity = 0.95
config.initial_rows = 28
config.initial_cols = 120

-- tab bar
config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
