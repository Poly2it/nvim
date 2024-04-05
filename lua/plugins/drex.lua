local M = {
	"TheBlob42/drex.nvim",
	commit = "acccc12",
	lazy = true,
	cmd = {
		"Drex",
		"DrexDrawerClose",
		"DrexDrawerFindFile",
		"DrexDrawerFindFileAndFocus",
		"DrexDrawerOpen",
		"DrexDrawerToggle",
		"DrexMark",
	},
	dependencies = {},
	opts = {
		icons = {
			file_default = "",
			dir_open = "",
			dir_closed = "",
			link = "",
			others = "",
		},
	},
	config = function(_, opts)
		require("drex.config").configure(opts)
	end
}


vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		if vim.fn.isdirectory(vim.fn.expand("%")) == 1 then
			require("drex").open_directory_buffer("")
		end
	end,
})


vim.api.nvim_set_keymap(
	"n",
	"+d",
	[[:lua require("drex.drawer").toggle()<CR>]],
	{
		noremap = true,
		silent = true,
		desc = "Toggle file drawer",
	}
)


return M

