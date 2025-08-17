vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { silent = true, noremap = true, desc = "Toggle file explorer" })

return {
	"https://github.com/nvim-tree/nvim-tree.lua",
	opts = {},
}
