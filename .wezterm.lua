local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Frappe"
config.font = wezterm.font("OperatorMono Nerd Font")
config.font_size = 16
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
