vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local virt_column_level = {
			["c"] = "81,121",
			["lua"] = "121",
			["python"] = "81",
			["markdown"] = "81",
		}
		local virt_column_ignore = {
			["drex"] = true,
		}

		local file_type = vim.bo.filetype
		if virt_column_ignore[file_type] ~= nil then
			return
		end
		if (virt_column_level[file_type] == nil) then
			local lazy = require("lazy")
			local plugins = lazy.plugins()
			local lazy_data_virt_column  = nil
			for plugin = 1, #plugins, 1 do
				if plugins[plugin][1] == "lukas-reineke/virt-column.nvim" then
					lazy_data_virt_column = plugins[plugin]
					break
				end
			end
			if lazy_data_virt_column ~= nil and lazy_data_virt_column["_"]["loaded"] ~= nil then
				local virt_column = require("virt-column")
				virt_column.overwrite({
					virtcolumn = "",
				})
			end
		else
			local virt_column = require("virt-column")
			virt_column.overwrite({
				char = "▏",
				virtcolumn = virt_column_level[file_type],
			})
		end
	end,
})

