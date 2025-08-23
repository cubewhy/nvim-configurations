vim.keymap.set("n", "<leader>tt", '<CMD>ToggleTerm size=18 dir=. direction=horizontal name=default<CR>', { desc = "Toggle default terminal" })
vim.keymap.set("n", "<leader>th", '<CMD>TermNew size=18 dir=. direction=horizontal<CR>', { desc = "Create terminal horizontally" })
vim.keymap.set("n", "<leader>tT", '<CMD>ToggleTerm dir=. direction=float name=default<CR>', { desc = "Open floatting terminal" })

return {
	{
		"akinsho/toggleterm.nvim",
		opts = {},
	},
}
