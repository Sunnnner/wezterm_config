-- path:.config/wezterm/config/keys.lua
local wezterm = require("wezterm")
local platform = require("utils.platform")()
local act = wezterm.action

local mod = {}

if platform.is_mac then
	mod.SUPER = "SUPER"
	mod.SUPER_REV = "SUPER|CTRL"
elseif platform.is_win or platform.is_linux then
	mod.SUPER = "ALT" -- to not conflict with Windows key shortcuts
	mod.SUPER_REV = "ALT|CTRL"
end

local keys = {
	-- SUPER+d 水平切分（左右分屏）
	{
		key = "d",
		mods = mod.SUPER,
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- SUPER+SHIFT+d 垂直切分（上下分屏）
	{
		key = "d",
		mods = mod.SUPER .. "|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- SUPER+w 关闭当前分屏（Pane）
	{
		key = "w",
		mods = mod.SUPER,
		action = act.CloseCurrentPane({ confirm = true }),
	},
}

return {
	disable_default_key_bindings = false,
	leader = { key = "Space", mods = mod.SUPER_REV },
	keys = keys,
}
