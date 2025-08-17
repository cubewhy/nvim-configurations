vim.keymap.set("n", "<leader>fT", '<CMD>lua require("FTerm").toggle()<CR>', { desc = "Open floating terminal" })

return {
	"https://github.com/numToStr/FTerm.nvim",
	opts = {},
}
