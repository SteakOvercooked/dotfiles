local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Disables the load of .profile on every startup
config.default_prog = { '/usr/bin/bash' }
config.max_fps = 144
-- Disable the animations of cursor
config.animation_fps = 1
config.cursor_blink_rate = 600
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.window_padding = {
  top = 0,
  right = 0,
  bottom = 0,
  left = 0
}
config.font = wezterm.font 'SauceCodePro Nerd Font Mono'
-- config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'
config.color_scheme = 'GruvboxDark'
-- config.color_scheme = 'Solarized Dark (Gogh)'
config.window_background_opacity = 0.9

return config
