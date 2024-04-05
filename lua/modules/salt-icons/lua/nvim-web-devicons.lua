local M = {}


local salt_icons = require("salt-icons")
local icons = salt_icons.icons


local setup_complete = false


function M.get_icons()
	if not setup_complete then
		M.setup()
	end
	return icons.all
end


---@deprecated
function M.set_up_highlights(_)
end


function M.has_loaded()
	return setup_complete
end


function M.setup(_)
	if not setup_complete then
		require("salt-icons")
	end
	setup_complete = true
end


function M.get_default_icon()
	return icons.default
end


function M.get_icon(name, _, _)
	return salt_icons.get(name)
end


function M.get_icon_name_by_filetype(ft)
	local icon = icons.by_filetype[ft] or { name = "" }
	return icon.name
end


function M.get_icon_by_filetype(ft, _)
	return salt_icons.get_by_filetype(ft)
end


function M.get_icon_colors(name, _, _)
	local icon, color = M.get_icon_colors(name)
	return icon, color, 15
end


function M.get_icon_colors_by_filetype(ft, _)
	local icon, color = M.get_icon_color_by_filetype(ft)
	return icon, color, 15
end


function M.get_icon_color(name, _, _)
	local icon, color = salt_icons.get_by_filetype(name)
	local info = vim.api.nvim_get_hl(0, {
		name = color,
		link = true,
	})
	return icon, info.fg
end


function M.get_icon_color_by_filetype(ft, _)
	local icon, color = salt_icons.get_by_filetype(ft)
	local info = vim.api.nvim_get_hl(0, {
		name = color,
		link = true,
	})
	return icon, info.fg
end


function M.get_icon_cterm_color(name, _, _)
	local icon, _ = salt_icons.get(name)
	return icon, 15
end


function M.get_icon_cterm_color_by_filetype(_, _)
	return 15
end


---@deprecated
function M.set_icon(_)
end


---@deprecated
function M.set_icon_by_filetype(_)
end


---@deprecated
function M.set_default_icon(_, _, _)
end


---@deprecated
function M.refresh()
end


return M

