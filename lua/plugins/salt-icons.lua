local colors = require("adwaita.utils").gen_colors()


local M = {
	dir = vim.fn.stdpath("config") .. "/lua/modules/salt-icons",
	lazy = false,
	opts = {
		use_defaults = false,
		-- Drex requires all highlights to be available before the frame has rendered, or they will never
		-- register.
		set_highlights_lazily = false,
		icons = {
			by_filename = {
				[".gitignore"]     = { icon = "󰊢", color = colors.red_1    },
				[".gitattributes"] = { icon = "󰊢", color = colors.red_1    },
				[".gitkeep"]       = { icon = "󰊢", color = colors.red_1    },
				[".clangd"]        = { icon = "", color = colors.light_7  },
				["platformio.ini"] = { icon = "", color = colors.orange_3 },
				[".luacheckrc"]    = { icon = "󰢱", color = colors.blue_3   },
				["cargo.toml"]     = { icon = "󱘗", color = colors.orange_5 },
				[".npmignore"]     = { icon = "󰛷", color = colors.red_2    },
				[".editorconfig"]  = { icon = "", color = colors.light_2  },

				["py.typed"] = { icon = "", color = colors.light_2 },

				["dockerfile"]  = { icon = "󰡨", color = colors.blue_2 },

				["compile_commands.json"] = { icon = "", color = colors.light_7 },

				["flake.lock"] = { icon = "", color = colors.blue_1 },

				[".profile"]      = { icon = "", color = colors.green_1 },
				[".bashrc"]       = { icon = "", color = colors.green_1 },
				[".bash_login"]   = { icon = "", color = colors.green_1 },
				[".bash_logout"]  = { icon = "", color = colors.green_1 },
				[".bash_profile"] = { icon = "", color = colors.green_1 },

				["cmakelists.txt"] = { icon = "", color = colors.green_4 },
				["cmakecache.txt"] = { icon = "", color = colors.green_4 },
			},
			by_filetype = {
				["c"]     = { icon = "", color = colors.light_7  },
				["h"]     = { icon = "", color = colors.light_7  },
				["c3"]    = { icon = "", color = colors.light_2  },
				["c3i"]   = { icon = "", color = colors.light_2  },
				["cpp"]   = { icon = "", color = colors.blue_1   },
				["cc"]    = { icon = "", color = colors.blue_1   },
				["hpp"]   = { icon = "", color = colors.blue_1   },
				["hxx"]   = { icon = "", color = colors.blue_1   },
				["lua"]   = { icon = "󰢱", color = colors.blue_3   },
				["vim"]   = { icon = "", color = colors.green_4  },
				["py"]    = { icon = "󰌠", color = colors.teal_1   },
				["gs"]    = { icon = "󱊈", color = colors.yellow_3 },
				["h.gs"]  = { icon = "󱊍", color = colors.yellow_3 },
				["js"]    = { icon = "󰌞", color = colors.yellow_2 },
				["cjs"]   = { icon = "󰌞", color = colors.yellow_2 },
				["ejs"]   = { icon = "󰌞", color = colors.yellow_2 },
				["mjs"]   = { icon = "󰌞", color = colors.yellow_2 },
				["ts"]    = { icon = "󰛦", color = colors.blue_2   },
				["cts"]   = { icon = "󰛦", color = colors.blue_2   },
				["rs"]    = { icon = "󱘗", color = colors.orange_5 },
				["swift"] = { icon = "󰛥", color = colors.orange_4 },
				["scm"]   = { icon = "", color = colors.dark_3   },
				["zig"]   = { icon = "", color = colors.yellow_2 },
				["java"]  = { icon = "󰬷", color = colors.teal_1  },

				["pyi"]  = { icon = "", color = colors.light_2 },

				["nix"] = { icon = "", color = colors.blue_1 },

				["cmake"]  = { icon = "", color = colors.green_4 },

				["sh"]   = { icon = "", color = colors.green_1 },
				["zsh"]  = { icon = "", color = colors.green_1 },
				["csh"]  = { icon = "", color = colors.green_1 },
				["fish"] = { icon = "", color = colors.green_1 },
				["bat"]  = { icon = "", color = colors.blue_3  },
				["ps1"]  = { icon = "", color = colors.blue_3  },

				["o"]     = { icon = "", color = colors.light_2  },
				["a"]     = { icon = "", color = colors.light_2  },
				["so"]    = { icon = "", color = colors.light_2  },
				["jar"]   = { icon = "", color = colors.orange_4 },
				["class"] = { icon = "", color = colors.orange_4 },
				["zip"]   = { icon = "", color = colors.light_2  },
				["tar"]   = { icon = "", color = colors.light_2  },

				["s"] = { icon = "", color = colors.light_2 },
				["S"] = { icon = "", color = colors.light_2 },
				["asm"] = { icon = "", color = colors.light_2 },
				["pyc"]  = { icon = "", color = colors.light_2 },
				["wasm"] = { icon = "", color = colors.purple_3 },

				["txt"]  = { icon = "", color = colors.light_2  },
				["md"]   = { icon = "", color = colors.light_2  },
				["html"] = { icon = "󰌝", color = colors.red_1    },

				["csr"] = { icon = "", color = colors.yellow_3 },
				["pem"] = { icon = "", color = colors.yellow_3 },
				["key"] = { icon = "", color = colors.yellow_3 },
				["enc"] = { icon = "", color = colors.yellow_3 },
				["sb3"] = { icon = "󰄛", color = colors.yellow_3 },

				["ini"]      = { icon = "", color = colors.light_7  },
				["cfg"]      = { icon = "", color = colors.light_7  },
				["in"]       = { icon = "", color = colors.light_7  },
				["desktop"]  = { icon = "", color = colors.light_7  },
				["yml"]      = { icon = "", color = colors.dark_3   },
				["yaml"]     = { icon = "", color = colors.dark_3   },
				["toml"]     = { icon = "", color = colors.orange_5 },
				["json"]     = { icon = "", color = colors.yellow_3 },
				["gyp"]      = { icon = "󰛷", color = colors.red_2    },
				["rockspec"] = { icon = "󰀘", color = colors.blue_3   },

				["css"] = { icon = "󰌜", color = colors.blue_5 },

				["svg"] = { icon = "󰜡", color = colors.orange_2 },

				["ttf"]   = { icon = "󰛖", color = colors.red_1 },
				["otf"]   = { icon = "󰛖", color = colors.red_1 },
				["woff"]  = { icon = "󰛖", color = colors.red_1 },
				["woff2"] = { icon = "󰛖", color = colors.red_1 },

				["png"]  = { icon = "", color = colors.purple_3 },
				["jpg"]  = { icon = "", color = colors.purple_3 },
				["jpeg"] = { icon = "", color = colors.purple_3 },
				["jxl"]  = { icon = "", color = colors.purple_3 },
				["ico"]  = { icon = "", color = colors.purple_3 },
				["icns"] = { icon = "", color = colors.purple_3 },

				["mp3"] = { icon = "", color = colors.purple_1 },
				["wav"] = { icon = "", color = colors.purple_1 },
			},
			by_filestem = {
				["readme"]    = { icon = "", color = colors.light_2  },
				["license"]   = { icon = "", color = colors.yellow_3 },
				["licence"]   = { icon = "", color = colors.yellow_3 },
				["copying"]   = { icon = "", color = colors.yellow_3 },
				["unlicense"] = { icon = "", color = colors.yellow_3 },
				["unlicence"] = { icon = "", color = colors.yellow_3 },
				["changelog"] = { icon = "", color = colors.light_2  },
				["history"]   = { icon = "", color = colors.light_2  },
				["updates"]   = { icon = "", color = colors.light_2  },
				["makefile"]  = { icon = "", color = colors.green_3  },
			},
			default = { icon = "", color = colors.light_2 },
		},
	},
}


return M

