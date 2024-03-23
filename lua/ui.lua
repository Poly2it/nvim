vim.opt.fillchars = {
	stl = " ",        -- statusline of the current window
	stlnc = " ",      -- statusline of the non-current windows
	wbr = " ",        -- window bar
	horiz = " ",      -- horizontal separators :split
	horizup = "▏",    -- upwards facing horizontal separator
	horizdown = "▏",  -- downwards facing horizontal separator
	vert = "▏",       -- vertical separators :vsplit
	vertleft = "▏",   -- left facing vertical separator
	vertright = "▏",  -- right facing vertical separator
	verthoriz = "▏",  -- overlapping vertical and horizontal separator
	fold = "·",       -- filling "foldtext",
	foldopen = "-",   -- mark the beginning of a fold
	foldclose = "+",  -- show a closed fold
	foldsep = "│",    -- open fold middle marker
	diff = "-",       -- deleted lines of the "diff", option
	msgsep = " ",     -- message separator "display",
	eob = "~",        -- empty lines at the end of a buffer
	lastline = "@",   -- "display", contains lastline/truncate
}

local colors = require("adwaita.utils").gen_colors()
vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.libadwaita_dark_alt, bg = colors.libadwaita_dark })

