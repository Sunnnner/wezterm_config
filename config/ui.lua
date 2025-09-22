-- path:.config/wezterm/config/ui.lua
local wezterm = require("wezterm")
local c_init = require("colors.init")
local colors = c_init["flexoki"]
local fonts = { "Menlo" }
local primary_font = fonts[1] or "Menlo"

return {
	animation_fps = 60,
	max_fps = 120,
	front_end = "WebGpu",
	font = wezterm.font(primary_font, { weight = "Thin", italic = false }), -- 字体
	font_size = 13,
	webgpu_power_preference = "HighPerformance",
	webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[1],
	colors = colors, -- 主题配色
	hide_tab_bar_if_only_one_tab = true,
	-- scrollbar
	enable_scroll_bar = true, -- 是否显示滚动条
	-- tab bar
	enable_tab_bar = true, -- 是否显示标签
	use_fancy_tab_bar = true,
	tab_max_width = 25,
	show_tab_index_in_tab_bar = false, -- 是否显示tab标签数
	switch_to_last_active_tab_when_closing_tab = true,
    macos_window_background_blur = 20, -- macOS 背景模糊
	background = {
		{
			source = { Color = colors.background },
			height = "100%",
			width = "100%",
			opacity = 0.99, -- 背景透明度
		},
	},
	-- window
	initial_cols = 100, -- 默认打开宽高
	initial_rows = 40,
	line_height = 1.06, -- 默认上下间距
	window_padding = { -- 四周padding，为0消除边框间距
		left = 10,
		right = 10,
		top = 10,
		bottom = 7,
	},
    adjust_window_size_when_changing_font_size = false,
	window_close_confirmation = "NeverPrompt",
	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.65,
	},
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBar", -- 改变光标形状
}
