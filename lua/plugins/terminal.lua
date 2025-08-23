vim.keymap.set("n", "<leader>th", '<CMD>ToggleTerm size=18 dir=. direction=horizontal name=defaulth<CR>', { desc = "Toggle the horizontal terminal group" })
vim.keymap.set("n", "<leader>tH", '<CMD>TermNew size=18 dir=. direction=horizontal<CR>', { desc = "Create terminal horizontally" })

vim.keymap.set("n", "<leader>tv", '<CMD>ToggleTerm size=18 dir=. direction=vertical name=defaultv<CR>', { desc = "Toggle the vertical terminal group" })
vim.keymap.set("n", "<leader>tV", '<CMD>TermNew size=18 dir=. direction=vertical<CR>', { desc = "Create terminal vertically" })

vim.keymap.set("n", "<leader>tT", '<CMD>ToggleTerm dir=. direction=tab name=defaulttab<CR>', { desc = "Open terminal from a new tab" })

vim.keymap.set("n", "<leader>tF", '<CMD>ToggleTerm dir=. direction=float name=defaultfloatting<CR>', { desc = "Open floatting terminal" })

return {
	{
		"akinsho/toggleterm.nvim",
		opts = {},
	},
}
