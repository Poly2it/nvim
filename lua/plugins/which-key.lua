local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		icons = {
			breadcrumb = "",
			separator = "",
			group = " ",
		},
		window = {
			border = "none",
			position = "bottom",
			margin = { 0, 0, 0, 0 },
			padding = { 1, 1, 1, 1 },
			winblend = 0,
			zindex = 1000,
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 16, max = 40 },
			spacing = 2,
			align = "left",
		},
	}
}


return M

