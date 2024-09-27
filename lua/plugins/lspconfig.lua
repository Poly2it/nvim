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
		local util = require("lspconfig.util")

		lspconfig.clangd.setup({
			root_dir = util.root_pattern("compile_commands.json", ".clangd", ".git"),
			cmd = {
				"clangd",
				"--background-index",
				"--suggest-missing-includes",
				"--header-insertion=iwyu",
				"--pch-storage=memory",
			},
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			handlers = {
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {}),
				["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {}),
			},
		})

		lspconfig.lua_ls.setup({
			root_dir = util.root_pattern("shell.nix", ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"),
			on_init = function(client)
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
					return
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						version = "LuaJIT"
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME
						}
					}
				})
			end,
			settings = {
				Lua = {
				}
			}
		})

		lspconfig.nixd.setup({})

		lspconfig.basedpyright.setup({})

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

