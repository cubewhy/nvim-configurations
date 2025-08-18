vim.keymap.set("n", "<leader>cs", "<CMD>AerialToggle<CR>", { desc = "Toggle Outline" })

return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
