local wezterm = require("wezterm")

local config = {}

config.term = "xterm-256color"

config.color_scheme = "Kanagawa (Gogh)"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 0

config.font_size = 18
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "ExtraBold" })
config.line_height = 0.90

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
  left = "0.8cell",
  right = "0.8cell",
  top = "0.5cell",
  bottom = "0.5cell",
}

config.keys = {
  {
    key = "{",
    mods = "SHIFT|ALT",
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    key = "}",
    mods = "SHIFT|ALT",
    action = wezterm.action.MoveTabRelative(1),
  },
}

return config
