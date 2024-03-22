local M = {
	"jbyuki/venn.nvim",
	commit = "e4d6834",
	lazy = true,
	cmd = {
		"VBox",
		"VBoxD",
		"VBoxH",
		"VBoxO",
		"VBoxDO",
		"VBoxHO",
		"VFill",
	},
}


function toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true

        vim.cmd[[setlocal ve=all]]

        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })

        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end


vim.api.nvim_set_keymap(
	"n",
	"+v",
	":lua toggle_venn()<CR>",
	{
		noremap = true,
		silent = true,
		desc = "Toggle diagram drawing mode",
	}
)


return M

