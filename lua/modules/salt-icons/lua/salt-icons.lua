---@alias icon { icon: string, color: string?, highlight: string?, name: string?, meta: { highlight: string? }?}
---@alias icons { all: { [string]: icon }?, by_filetype: { [string]: icon }, by_filename: { [string]: icon }, by_filestem: { [string]: icon }, default: icon}


local M = {}


---@type icons
M.icons = {
	by_filename = {
		[".gitignore"] = { icon = "󰊢", highlight = "Directory" },
	},
	by_filetype = {
		["lua"] = { icon = "󰢱", highlight = "Directory" },
	},
	by_filestem = {
		["readme"] = { icon = "", highlight = "Directory" },
	},
	default = { icon = "", highlight = "Directory" }
}


---@param icon icon
---@param name string
local function icon_update(icon, name)
	if icon.meta == nil then
		icon.meta = {}
	end
	if icon.name == nil then
		if name:len() > 1 then
			icon.name = name:sub(1, 1):upper() .. name:sub(2, #name)
		else
			icon.name = name:upper()
		end
	end
end


---@param icon icon
---@param overwrite boolean
local function icon_update_highlight_legacy(icon, overwrite)
	if (icon.meta.highlight == nil) or (overwrite == true) then
		if icon.highlight == nil then
			icon.meta.highlight = "DevIcon" .. icon.name
			vim.api.nvim_set_hl(0, icon.meta.highlight, {
				fg = icon.color,
			})
		else
			icon.meta.highlight = "DevIcon" .. icon.name
			vim.api.nvim_set_hl(0, icon.meta.highlight, {
				link = icon.highlight,
			})
		end
	end
end


---@param icon icon
---@param overwrite boolean
local function icon_update_highlight(icon, overwrite)
	if (icon.meta.highlight == nil) or (overwrite == true) then
		if icon.highlight == nil then
			icon.meta.highlight = "DevIcon" .. icon.name
			vim.api.nvim_set_hl(0, icon.meta.highlight, {
				fg = icon.color,
				force = true,
			})
		else
			icon.meta.highlight = "DevIcon" .. icon.name
			vim.api.nvim_set_hl(0, icon.meta.highlight, {
				link = icon.highlight,
				force = true,
			})
		end
	end
end


---Set up the plugin.
---@param opts { use_defaults: boolean?, set_highlights_lazily: boolean?, icons: icons? }
function M.setup(opts)
	local user_icons = opts.icons or {}
	local salt_icons = M.icons

	local version = vim.version()
	print(version.major, version.minor)
	if version.major == 0 and version.minor < 10 then
		icon_update_highlight = icon_update_highlight_legacy
	end

	if opts.use_defaults == false then
		salt_icons = user_icons
		salt_icons.by_filetype = salt_icons.by_filetype or {}
		salt_icons.by_filename = salt_icons.by_filename or {}
		salt_icons.by_filestem = salt_icons.by_filestem or {}
	else
		if #user_icons.by_filetype or 0 > #salt_icons.by_filetype or 0 then
			salt_icons.by_filetype, user_icons.by_filetype = user_icons.by_filetype, salt_icons.by_filetype
		end
		for filetype, icon in pairs(user_icons.by_filetype or {}) do
			salt_icons.by_filetype[filetype] = icon
		end

		if #user_icons.by_filename or 0 > #salt_icons.by_filename or 0 then
			salt_icons.by_filename, user_icons.by_filename = user_icons.by_filename, salt_icons.by_filename
		end
		for filename, icon in pairs(user_icons.by_filename or {}) do
			salt_icons.by_filename[filename] = icon
		end

		if #user_icons.by_filestem or 0 > #salt_icons.by_filestem or 0 then
			salt_icons.by_filestem, user_icons.by_filestem = user_icons.by_filestem, salt_icons.by_filestem
		end
		for filestem, icon in pairs(user_icons.by_filestem or {}) do
			salt_icons.by_filestem[filestem] = icon
		end

		if user_icons.default ~= nil then
			salt_icons.default = user_icons.default
		end
	end

	M.icons = salt_icons
	salt_icons.all = {}

	if opts.set_highlights_lazily == true then
		for filetype, icon in pairs(salt_icons.by_filetype or {}) do
			icon_update(icon, filetype)
			table.insert(salt_icons.all, icon)
		end
		for filename, icon in pairs(salt_icons.by_filename or {}) do
			icon_update(icon, filename)
			table.insert(salt_icons.all, icon)
		end
		for filestem, icon in pairs(salt_icons.by_filestem or {}) do
			icon_update(icon, filestem)
			table.insert(salt_icons.all, icon)
		end
	else
		for filetype, icon in pairs(salt_icons.by_filetype or {}) do
			icon_update(icon, filetype)
			icon_update_highlight(icon, true)
			table.insert(salt_icons.all, icon)
		end
		for filename, icon in pairs(salt_icons.by_filename or {}) do
			icon_update(icon, filename)
			icon_update_highlight(icon, true)
			table.insert(salt_icons.all, icon)
		end
		for filestem, icon in pairs(salt_icons.by_filestem or {}) do
			icon_update(icon, filestem)
			icon_update_highlight(icon, true)
			table.insert(salt_icons.all, icon)
		end
	end
	icon_update(salt_icons.default, "default")
	table.insert(salt_icons.all, salt_icons.default)
	icon_update_highlight(salt_icons.default, true)

	require("nvim-web-devicons").setup()
end


---Gets the icon of a filename and extension.
---@param name string
---@return string icon
---@return string highlight
function M.get(name)
	---@type string
	name = name:lower()
	local by_name = M.icons.by_filename[name]
	if by_name ~= nil then
		icon_update_highlight(by_name, false)
		return by_name.icon, by_name.meta.highlight
	end

	---@type string
	local type = name:sub((name:find("%.") or name:len()) + 1)
	local by_type = M.icons.by_filetype[type]

	---@type string
	local stem
	if type:len() == 0 then
		stem = name
	else
		stem = name:sub(1, name:len() - type:len() - 1)
	end

	local by_stem = M.icons.by_filestem[stem]
	if by_stem ~= nil then
		icon_update_highlight(by_stem, false)
		return by_stem.icon, by_stem.meta.highlight
	end
	if by_type ~= nil then
		icon_update_highlight(by_type, false)
		return by_type.icon, by_type.meta.highlight
	end

	while type:len() > 0 do
		type = type:sub((type:find("%.") or type:len()) + 1)
		by_type = M.icons.by_filetype[type]
		if by_type ~= nil then
			icon_update_highlight(by_type, false)
			return by_type.icon, by_type.meta.highlight
		end
	end

	local icon = M.icons.default
	return icon.icon, icon.meta.highlight
end


---Gets the icon by filename.
---@param name string
---@return string icon
---@return string highlight
function M.get_by_filename(name)
	local icon = M.icons.by_filename[name:lower()] or M.icons.default
	icon_update_highlight(icon, false)
	return icon.icon, icon.meta.highlight
end


---Gets the icon by filetype.
---@param type string
---@return string icon
---@return string highlight
function M.get_by_filetype(type)
	local icon = M.icons.by_filetype[type:lower()] or M.icons.default
	icon_update_highlight(icon, false)
	return icon.icon, icon.meta.highlight
end

---Gets the icon by filename stem.
---@param stem string
---@return string icon
---@return string highlight
function M.get_by_filestem(stem)
	local icon = M.icons.by_filestem[stem:lower()] or M.icons.default
	icon_update_highlight(icon, false)
	return icon.icon, icon.meta.highlight
end


return M

