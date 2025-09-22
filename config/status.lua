-- path:.config/wezterm/config/status.lua
local wezterm = require("wezterm")

local function abbreviate_home(path)
	local home = wezterm.home_dir or ""
	if home ~= "" and path:find(home, 1, true) == 1 then
		return path:gsub("^" .. home, "~")
	end
	return path
end

local function build_cells(window, pane)
	local cells = {}

	local workspace = window:active_workspace()
	if workspace and workspace ~= "" then
		table.insert(cells, workspace)
	end

	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		local cwd = cwd_uri.file_path or cwd_uri.path or ""
		if cwd ~= "" then
			local display = abbreviate_home(cwd)
			local short = display
			if #display > 30 then
				local tail = display:match("([^/]+/[^/]+)$")
				if tail then
					short = "…/" .. tail
				end
			end
			table.insert(cells, short)
		end
	end

	table.insert(cells, wezterm.strftime("%Y-%m-%d %H:%M"))

	return cells
end

local function format_cells(cells)
	if #cells == 0 then
		return ""
	end
	return wezterm.format({
		{ Attribute = { Intensity = "Half" } },
		{ Text = " " .. table.concat(cells, "  │  ") .. " " },
	})
end

wezterm.on("update-status", function(window, pane)
	local cells = build_cells(window, pane)
	window:set_left_status("")
	window:set_right_status(format_cells(cells))
end)

return {
	-- 可以按需扩展其他状态相关配置
}
