local M = {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	event = { "VeryLazy", "BufReadPre", "BufNewFile", },
	main = "ibl",
	opts = {
		indent = {
			highlight = { "Whitespace" },
			char = "▏",
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)
	end
}


return M

