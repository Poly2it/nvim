vim.loader.enable()


local function merge(t1, t2)
	for k, v in pairs(t2) do
		t1[k] = v
	end
	return t1
end


function require_path(path)
	local package_path = package.path

	local last_delimiter = path:match'^.*()[/\\]'
	local path_stem = string.sub(path, last_delimiter + 1)

	package.path = package.path .. ";" .. path
	local module = require(path_stem)

	package.path = package_path

	return module
end


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


local opts = {}
require("lazy").setup("plugins", opts)


local options = {
	number = true,
	relativenumber = true,
}
vim.o = merge(vim.o, options)


require_path(vim.fn.stdpath("config") .. "/lua/file_types.lua")
require_path(vim.fn.stdpath("config") .. "/lua/ui.lua")

