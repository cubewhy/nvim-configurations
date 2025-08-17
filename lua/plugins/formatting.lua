vim.keymap.set("n", "<leader>cf", function()
	vim.lsp.buf.format()
end, { desc = "Format current file" })

return {
	{
		"https://github.com/stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}
