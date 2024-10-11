local M = {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	event = { "VeryLazy", "BufReadPre", "BufNewFile", },
	cmd = {
		"Gitsigns"
	},
	config = function (_, opts)
		require("gitsigns").setup()
	end
}


return M

