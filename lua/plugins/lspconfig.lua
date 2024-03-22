local M = {
	"neovim/nvim-lspconfig",
	lazy = true,
	cmd = {
		"LspInfo",
		"LspLog",
		"LspRestart",
		"LspStart",
		"LspInfo",
	},
	event = { "VeryLazy", "BufReadPre", },
	config = function()
		local lspconfig = require("lspconfig")

		lspconfig.clangd.setup({
			root_dir = vim.lsp.buf.list_workspace_folders()[-1],
			cmd = {
				"clangd",
				"--background-index",
				"--suggest-missing-includes",
				"--header-insertion=iwyu",
				"--pch-storage=memory",
			},
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			handlers = {
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help),
				["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format { async = true }
				end, opts)
			end,
		})
	end,
}


return M

