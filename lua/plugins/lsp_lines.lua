local M = {
	"Poly2it/lsp_lines",
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

