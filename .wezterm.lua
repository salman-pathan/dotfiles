local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Frappe"
config.font = wezterm.font("CommitMono Nerd Font")
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false

return config
