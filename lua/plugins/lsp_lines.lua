local M = {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	commit = "6f3defec",
	lazy = true,
	event = { "BufReadPre", "BufNewFile", },
	config = function()
		require("lsp_lines").setup()

		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
}


return M

