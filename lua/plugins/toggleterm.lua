local M = {
	"akinsho/toggleterm.nvim",
	lazy = true,
	cmd = {
		"ToggleTerm",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualLines",
		"ToggleTermSendVisualSelection",
		"ToggleTermSetNames",
		"ToggleTermToggleAll",
	},
	version = "*", 
	opts = {
		shade_terminals = true,
		open_mapping = '<C-\\>',
		start_in_insert = true,
		direction = "horizontal",
		shading_factor = 0,

		persist_size = true,
		persist_mode = true,

		winbar = {
			enabled = false,
			name_formatter = function(term)
				return term.name
			end,
		},
	},
	config = function ()
		require("toggleterm").setup(opts)
	end,
}


keymaps_terminal_set = function ()
	local opts = { buffer = vim.api.nvim_get_current_buf() }

	vim.keymap.set("t", "+<Esc>", [[<C-\><C-n>]], opts)

	vim.keymap.set("t", "+w", function ()
		vim.api.nvim_command("ToggleTerm")
	end)

	vim.keymap.set("t", "<C-w>h",  [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-w>j",  [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-w>k",  [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-w>l",  [[<Cmd>wincmd l<CR>]], opts)

	vim.keymap.set("t", "<C-w>H",  [[<Cmd>wincmd H<CR>]], opts)
	vim.keymap.set("t", "<C-w>J",  [[<Cmd>wincmd J<CR>]], opts)
	vim.keymap.set("t", "<C-w>K",  [[<Cmd>wincmd K<CR>]], opts)
	vim.keymap.set("t", "<C-w>L",  [[<Cmd>wincmd L<CR>]], opts)

	vim.keymap.set("t", "<C-w-H>", [[<Cmd>wincmd H<CR>]], opts)
	vim.keymap.set("t", "<C-w-J>", [[<Cmd>wincmd J<CR>]], opts)
	vim.keymap.set("t", "<C-w-K>", [[<Cmd>wincmd K<CR>]], opts)
	vim.keymap.set("t", "<C-w-L>", [[<Cmd>wincmd L<CR>]], opts)
end


vim.keymap.set(
	"n",
	"+w",
	function ()
		vim.api.nvim_command("ToggleTerm")
		keymaps_terminal_set()
	end,
	{
		noremap = true,
		silent = true,
		desc = "Toggle terminal",
	}
)


local powershell_options = {
	shell = "powershell.exe",
	shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
	shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
	shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
	shellquote = "",
	shellxquote = "",
}


local bash_options = {
	shell = "bash.exe",
	shellcmdflag = "--login -i -c",
	shellredir = "",
	shellpipe = "2>&1",
	shellquote = "",
	shellxquote = "",
}


for option, value in pairs(bash_options) do
	vim.opt[option] = value
end


-- Preload terminal instance
vim.api.nvim_create_autocmd("UiEnter", {
	pattern = "*",
	callback = function()
		vim.api.nvim_command("ToggleTerm")
		vim.api.nvim_command("ToggleTerm")
	end,
})


return M

