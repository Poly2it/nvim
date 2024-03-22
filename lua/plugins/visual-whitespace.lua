local M = {
	"mcauley-penney/visual-whitespace.nvim",
	lazy = true,
	event = { "VeryLazy", "BufReadPre", "BufNewFile", },
	commit = "100c308",
	opts = {
		highlight = { link = "Visual" },
		space_char = "·",
		tab_char = "│      ",
		nl_char = ""
	},
	config = true,
}


return M

