local M = {
	"hrsh7th/nvim-cmp",
	dependencies = { "dcampos/nvim-snippy" },
	lazy = true,
	config = function()
		local cmp = require("cmp")
		local snippy = require("snippy")
		local lspkind = require("lspkind")

		local cmp_kinds = {
			Text = "  ",
			Method = "  ",
			Function = "  ",
			Constructor = "  ",
			Field = "  ",
			Variable = "  ",
			Class = "  ",
			Interface = "  ",
			Module = "  ",
			Property = "  ",
			Unit = "  ",
			Value = "  ",
			Enum = "  ",
			Keyword = "  ",
			Snippet = "  ",
			Color = "  ",
			File = "  ",
			Reference = "  ",
			Folder = "  ",
			EnumMember = "  ",
			Constant = "  ",
			Struct = "  ",
			Event = "  ",
			Operator = "  ",
			TypeParameter = "  ",
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					snippy.expand_snippet(args.body)
				end,
			},
			formatting = {
				fields = { "kind", "abbr", },
				format = function(entry, vim_item)
					if (string.sub(vim_item.abbr, 1, 3) == "•") then
						-- Importable
						vim_item.abbr = string.sub(vim_item.abbr, 4, #vim_item.abbr - 1) .. " "
					else
						if (string.sub(vim_item.abbr, 1, 2) == " ") then
							-- Available
							vim_item.abbr = string.sub(vim_item.abbr, 2, #vim_item.abbr)
						end
					end
					if (string.sub(vim_item.abbr, #vim_item.abbr, #vim_item.abbr) == "~") then
						-- With automatic fields
						vim_item.abbr = string.sub(vim_item.abbr, 1, #vim_item.abbr - 1) .. "  "
					end

					local kind = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
					})(
						entry,
						vim_item
					)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or " ") .. " "
					kind.menu = ""

					return kind
				end,
			},
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = -4,
					size_padding = 0,
				},
				documentation = {
					col_offset = -10,
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "snippy" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", vim.api.nvim_get_hl_by_name("Error", true))
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", vim.api.nvim_get_hl_by_name("Search", true))
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", vim.api.nvim_get_hl_by_name("Search", true))
		vim.api.nvim_set_hl(0, "CmpItemMenu", vim.api.nvim_get_hl_by_name("Title", true))

		vim.api.nvim_set_hl(0, "CmpItemKindField", { link = "@field" })
		vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "@property" })
		vim.api.nvim_set_hl(0, "CmpItemKindEvent", { link = "@function" })

		vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "@string" })
		vim.api.nvim_set_hl(0, "CmpItemKindEnum", { link = "@structure" })
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { link = "@keyword" })

		vim.api.nvim_set_hl(0, "CmpItemKindConstant", { link = "@constant" })
		vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { link = "@constructor" })
		vim.api.nvim_set_hl(0, "CmpItemKindReference", { link = "@type" })

		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { link = "@function" })
		vim.api.nvim_set_hl(0, "CmpItemKindStruct", { link = "@type"})
		vim.api.nvim_set_hl(0, "CmpItemKindClass", { link = "@type"})
		vim.api.nvim_set_hl(0, "CmpItemKindModule", { link = "@include"})
		vim.api.nvim_set_hl(0, "CmpItemKindOperator", { link = "@operator"})

		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { link = "@variable"})
		vim.api.nvim_set_hl(0, "CmpItemKindFile", { link = "@string"})

		vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "@string"})
		vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { link = "@preproc"})
		vim.api.nvim_set_hl(0, "CmpItemKindFolder", { link = "@string"})

		vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "@method" })
		vim.api.nvim_set_hl(0, "CmpItemKindValue", { link = "@variable" })
		vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { link = "@property" })

		vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "@type" })
		vim.api.nvim_set_hl(0, "CmpItemKindColor", { link = "@variable.builtin" })
		vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { link = "@variable.parameter" })
	end,
}


return M

