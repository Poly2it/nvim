local M = {
	"lukas-reineke/virt-column.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile", },
	opts = {
		char = "▏",
		virtcolumn = "",
	},
	config = function(_, opts)
		require("virt-column").setup(opts)
	end,
}


return M

