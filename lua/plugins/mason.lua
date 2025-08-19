vim.keymap.set("n", "<leader>lm", "<CMD>Mason<CR>", { desc = "Open Mason UI" })

return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		opts = {},

		config = function()
			local mason = require("mason")

			local mason_tool_installer = require("mason-tool-installer")

			-- enable mason and configure icons
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"stylua", -- lua formatter
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = false,
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
