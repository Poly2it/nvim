vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local virt_column_level = {
			["c"] = "81,121",
			["lua"] = "121",
			["python"] = "81",
			["markdown"] = "81",
		}

		local file_type = vim.bo.filetype
		if (virt_column_level[file_type] ~= nil) then
			local virt_column = require("virt-column")
			virt_column.overwrite({
				virtcolumn = virt_column_level[file_type]
			})
		end
	end,
})

