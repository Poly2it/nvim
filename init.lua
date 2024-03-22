local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"


vim.loader.enable()


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


require("lazy").setup("plugins", opts)


local function merge(t1, t2)
	for k, v in pairs(t2) do
		t1[k] = v
	end
	return t1
end


local options = {
	number = true,
	relativenumber = true,
}
vim.o = merge(vim.o, options)


function require_path(path)
	local package_path = package.path

	last_delimiter = path:match'^.*()[/\\]'
	path_stem = string.sub(path, last_delimiter + 1)
	
	package.path = package.path .. ";" .. path
	require(path_stem)

	package.path = package_path
end


require_path(vim.fn.stdpath("config") .. "/lua/file_types.lua")
require_path(vim.fn.stdpath("config") .. "/lua/ui.lua")

