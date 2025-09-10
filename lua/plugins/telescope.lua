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
				aerial = {
					-- Set the width of the first two columns (the second
					-- is relevant only when show_columns is set to 'both')
					col1_width = 4,
					col2_width = 30,
					-- How to format the symbols
					format_symbol = function(symbol_path, filetype)
						if filetype == "json" or filetype == "yaml" then
							return table.concat(symbol_path, ".")
						else
							return symbol_path[#symbol_path]
						end
					end,
					-- Available modes: symbols, lines, both
					show_columns = "both",
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
		init = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })

			vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>:", builtin.command_history, { desc = "Search Command History" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Search buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
			vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Search git files" })

			vim.keymap.set(
				"n",
				"<leader>sS",
				builtin.lsp_dynamic_workspace_symbols,
				{ desc = "Telescope LSP workspace symbols" }
			)
			vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Telescope LSP document symbols" })
			vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Telescope LSP definitions" })
			vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Telescope LSP references" })
			vim.keymap.set("n", "gm", builtin.lsp_implementations, { desc = "Telescope LSP implementations" })
			vim.keymap.set("n", "gy", builtin.lsp_type_definitions, { desc = "Telescope LSP type definitions" })
		end,
	},
}
