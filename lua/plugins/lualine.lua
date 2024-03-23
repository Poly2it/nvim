local M = {
	"nvim-lualine/lualine.nvim",
	lazy = true,
	event = { "UiEnter" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "adwaita",
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
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			}
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "location", "progress" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = { { "branch", icon = { "" } }, "diff" },
			lualine_z = { "diagnostics" }
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
		extensions = {}
	},
	config = function(_, opts)
		local colors = require("adwaita.utils").gen_colors()
		local theme = require("lualine.themes.adwaita")
		
		theme.normal.a.bg = colors.libadwaita_dark_alt
		theme.normal.b.bg = colors.libadwaita_dark_alt

		theme.insert.a.bg = colors.libadwaita_dark_alt
		theme.insert.b.bg = colors.libadwaita_dark_alt

		theme.visual.a.bg = colors.libadwaita_dark_alt
		theme.visual.b.bg = colors.libadwaita_dark_alt

		theme.normal.a.fg = colors.light_1
		theme.normal.b.fg = colors.light_7

		theme.insert.a.fg = colors.orange_3
		theme.insert.b.fg = colors.light_7

		theme.visual.a.fg = colors.blue_3
		theme.visual.b.fg = colors.light_7

		opts.options.theme = theme

		require("lualine").setup(opts)
	end,
}


return M

