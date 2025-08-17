vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })

vim.keymap.set("n", "<leader>dr", "<CMD>DapNew<CR>", { desc = "Start debugging" })
vim.keymap.set("n", "<F5>", "<CMD>DapContinue<CR>", { desc = "Continue" })
vim.keymap.set("n", "<F5>", "<CMD>DapStepOver<CR>", { desc = "Step Over" })
vim.keymap.set("n", "<F11>", "<CMD>DapStepInto<CR>", { desc = "Step Into" })
vim.keymap.set("n", "<S-F11>", "<CMD>DapStepOut<CR>", { desc = "Step Out" })

return {
	{
		"mfussenegger/nvim-dap",
	},
	{
		"jay-babu/mason-nvim-dap.nvim"
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	-- {
	-- 	"theHamsta/nvim-dap-virtual-text",
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	opts = {}
	-- }
}
