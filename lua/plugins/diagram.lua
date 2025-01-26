local M = {
	"3rd/diagram.nvim",
	lazy = true,
	event = { "VeryLazy", },
	dependencies = {
		"3rd/image.nvim",
	},
	opts = {
		renderer_options = {
			mermaid = {
				background = nil,
				theme = nil,
				scale = 1,
				width = nil,
				height = nil,
			},
			plantuml = {
				charset = nil,
			},
			d2 = {
				theme_id = nil,
				dark_theme_id = nil,
				scale = nil,
				layout = nil,
				sketch = nil,
			},
			gnuplot = {
				size = nil,
				font = nil,
				theme = nil,
			},
		}
	},
}


return M

