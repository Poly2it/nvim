local colors = require("adwaita.utils").gen_colors()


local M = {
	"nvim-tree/nvim-web-devicons",
	lazy = true,
	priority = 500,
	opts = {
		color_icons = true,
		default = false,
		strict = true,
		override = {},
		override_by_filename = {
			["README"] = {
				icon = "",
				color = colors.light_2,
				name = "Readme",
			},
			[".gitignore"] = {
				icon = "󰊢",
				color = colors.red_1,
				name = "Gitignore"
			},
			[".gitkeep"] = {
				icon = "󰊢",
				color = colors.red_1,
				name = "Gitkeep"
			},
			["makefile"] = {
				icon = "",
				color = colors.green_3,
				name = "Makefile",
			},
			["Makefile"] = {
				icon = "",
				color = colors.green_3,
				name = "Makefile",
			},
			[".clangd"] = {
				icon = "",
				color = colors.light_7,
				name = "Clangd",
			},
			["compile_commands.json"] = {
				icon = "",
				color = colors.light_7,
				name = "CompileCommands",
			},
			["platformio.ini"] = {
				icon = "",
				color = colors.orange_3,
				name = "PlatformioIni",
			},
		},
		override_by_extension = {
			["md"] = {
				icon = "",
				color = colors.light_0,
				name = "Markdown"
			},
			["c"] = {
				icon = "",
				color = colors.light_7,
				name = "C",
			},
			["h"] = {
				icon = "",
				color = colors.teal_5,
				name = "H",
			},
			["cpp"] = {
				icon = "",
				color = colors.blue_1,
				name = "Cpp",
			},
			["hpp"] = {
				icon = "",
				color = colors.purple_5,
				name = "Hpp",
			},
			["hxx"] = {
				icon = "",
				color = colors.purple_5,
				name = "Hpp",
			},
			["ini"] = {
				icon = "",
				color = colors.light_7,
				name = "Ini",
			},
		},
	},
	config = function(_, opts)
		require("nvim-web-devicons").setup(opts)
	end
}


return M

