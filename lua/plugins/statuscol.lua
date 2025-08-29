return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		-- vim.opt.signcolumn = "auto:3"
		-- vim.opt.mouse = "a"

		require("statuscol").setup({})
	end,
}
