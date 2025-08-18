local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })

vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>sS", builtin.lsp_dynamic_workspace_symbols, { desc = "Telescope LSP workspace symbols" })
vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Telescope LSP document symbols" })
vim.keymap.set("n", "gr", builtin.lsp_definitions, { desc = "Telescope LSP definitions" })
vim.keymap.set("n", "gd", builtin.lsp_references, { desc = "Telescope LSP references" })

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
		opts = {
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),

					-- pseudo code / specification for writing custom displays, like the one
					-- for "codeactions"
					-- specific_opts = {
					--   [kind] = {
					--     make_indexed = function(items) -> indexed_items, width,
					--     make_displayer = function(widths) -> displayer
					--     make_display = function(displayer) -> function(e)
					--     make_ordinal = function(e) -> string
					--   },
					--   -- for example to disable the custom builtin "codeactions" display
					--      do the following
					--   codeactions = false,
					-- }
				},
			},
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),

						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("noice")
		end,
	},
}
