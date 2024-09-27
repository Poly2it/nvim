local M = {
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	cmd = {
		"TSBufDisable",
		"TSBufEnable",
		"TSBufToggle",
		"TSConfigInfo",
		"TSDisable",
		"TSEditQuery",
		"TSEditQueryUserAfter",
		"TSEnable",
		"TSInstall",
		"TSInstallFromGrammar",
		"TSInstallInfo",
		"TSModuleSync",
		"TSToggle",
		"TSUninstall",
		"TSUpdate",
		"TSUpdateSync",
	},
	event = { "VeryLazy", "BufReadPre", },
	opts = {
		ensure_installed = {
			"c",
			"cpp",
			"rust",
			"lua",
			"python",
			"make",
			"cmake",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"json",
			"toml",
			"nix",
		},
		sync_install = false,
		auto_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}


return M

