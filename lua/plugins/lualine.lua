local colors = require_path(vim.fn.stdpath("config") .. "/lua/common.lua").colors


local M = {
	"nvim-lualine/lualine.nvim",
	lazy = true,
	event = { "UiEnter", },
	dependencies = {},
	opts = {
		options = {
			icons_enabled = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {
					"drex",
					"toggleterm",
				},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
			theme = {
				normal = {
					a = { bg = colors.libadwaita_dark_alt, fg = colors.light_1, gui = "bold" },
					b = { bg = colors.libadwaita_dark_alt, fg = colors.light_7, gui = "bold" },
					c = { bg = colors.libadwaita_dark_alt, fg = colors.light_7, gui = "bold" },
				},
				insert = {
					a = { bg = colors.libadwaita_dark_alt, fg = colors.orange_3, gui = "bold" },
					b = { bg = colors.libadwaita_dark_alt, fg = colors.light_7,  gui = "bold" },
					c = { bg = colors.libadwaita_dark_alt, fg = colors.light_7,  gui = "bold" },
				},
				visual = {
					a = { bg = colors.libadwaita_dark_alt, fg = colors.blue_3,  gui = "bold" },
					b = { bg = colors.libadwaita_dark_alt, fg = colors.light_7, gui = "bold" },
					c = { bg = colors.libadwaita_dark_alt, fg = colors.light_7, gui = "bold" },
				},
				replace = {
					a = { bg = colors.libadwaita_dark_alt, fg = colors.red_3,   gui = "bold" },
					b = { bg = colors.libadwaita_dark_alt, fg = colors.light_7, gui = "bold" },
					c = { bg = colors.libadwaita_dark_alt, fg = colors.light_7, gui = "bold" },
				},
				command = {
					a = { bg = colors.libadwaita_dark_alt, fg = colors.green_3, gui = "bold" },
					b = { bg = colors.libadwaita_dark_alt, fg = colors.light_7, gui = "bold" },
					c = { bg = colors.libadwaita_dark_alt, fg = colors.light_7, gui = "bold" },
				},
				inactive = {
					a = { bg = colors.libadwaita_dark_alt, fg = colors.libadwaita_dark_alt },
					b = { bg = colors.libadwaita_dark_alt, fg = colors.libadwaita_dark_alt },
					c = { bg = colors.libadwaita_dark_alt, fg = colors.libadwaita_dark_alt },
				},
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "location", "progress" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = { { "branch", icon = { "" } }, "diff" },
			lualine_z = { "diagnostics" },
		},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "diagnostics" },
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}


return M

