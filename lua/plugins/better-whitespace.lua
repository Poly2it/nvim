local M = {
	"ntpeters/vim-better-whitespace",
	commit = "86a0579b330b133b8181b8e088943e81c26a809e",
	lazy = true,
	event = { "VeryLazy", "BufReadPre", "BufNewFile", },
	cmd = {
		"EnableWhitespace",
		"DisableWhitespace",
		"ToggleWhitespace",
		"StripWhitespace",
		"EnableStripWhitespaceOnSave",
		"DisableStripWhitespaceOnSave",
		"ToggleStripWhitespaceOnSave",
	},
}


return M

