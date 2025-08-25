return {
	{
		{
			"neovim/nvim-lspconfig",
			event = { "BufReadPre", "BufNewFile" },
			opts = function(_, opts)
				opts.sources = opts.sources or {}
				table.insert(opts.sources, {
					name = "lazydev",
					group_index = 0, -- set group index to 0 to skip loading LuaLS completions
				})
			end,
			config = function()
				local lsp = require("lspconfig")
				local capabilities = require("cmp_nvim_lsp").default_capabilities()
				-- lsp.lua_ls.setup({ capabilities = capabilities })
				-- lsp.tsserver.setup({ capabilities = capabilities })
				-- lsp["<YOUR_LSP_SERVER>"].setup({ capabilities = capabilities })
			end,
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
			},
		},
		{
			"hrsh7th/nvim-cmp",
			event = { "InsertEnter", "CmdlineEnter" },
			dependencies = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-nvim-lsp",

				-- "hrsh7th/cmp-vsnip",
				-- "hrsh7th/vim-vsnip",

				"L3MON4D3/LuaSnip",
				-- "saadparwaiz1/cmp_luasnip",
				-- "dcampos/nvim-snippy",
				-- "dcampos/cmp-snippy",
				-- "SirVer/ultisnips",
				-- "quangnguyen30192/cmp-nvim-ultisnips",
				-- "echasnovski/mini.snippets",
				-- "abeldekat/cmp-mini-snippets",
			},
			opts = function(_, opts)
				opts.sources = opts.sources or {}
				table.insert(opts.sources, {
					name = "lazydev",
					group_index = 0, -- set group index to 0 to skip loading LuaLS completions
				})
			end,
			config = function()
				local cmp = require("cmp")
				local luasnip = require("luasnip")

				cmp.setup({
					snippet = {
						expand = function(args)
							-- vim.fn["vsnip#anonymous"](args.body)
							require("luasnip").lsp_expand(args.body)
							-- require("snippy").expand_snippet(args.body)
							-- vim.fn["UltiSnips#Anon"](args.body)
							-- vim.snippet.expand(args.body)
						end,
					},
					window = {
						-- completion = cmp.config.window.bordered(),
						-- documentation = cmp.config.window.bordered(),
					},
					mapping = cmp.mapping.preset.insert({
						["<C-b>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-e>"] = cmp.mapping.abort(),
						["<CR>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								if luasnip.expandable() then
									luasnip.expand()
								else
									cmp.confirm({
										select = true,
									})
								end
							else
								fallback()
							end
						end),

						["<Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							elseif luasnip.locally_jumpable(1) then
								luasnip.jump(1)
							else
								fallback()
							end
						end, { "i", "s" }),

						["<S-Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_prev_item()
							elseif luasnip.locally_jumpable(-1) then
								luasnip.jump(-1)
							else
								fallback()
							end
						end, { "i", "s" }),
					}),
					sources = cmp.config.sources({
						{ name = "nvim_lsp", group_index = 1 },
						-- { name = "vsnip" },
						{ name = "crates",   group_index = 1 },
						{ name = "path",     group_index = 2 },
						{ name = "luasnip",  group_index = 3 },
						-- { name = "ultisnips" },
						-- { name = "snippy" },
					}, {
						{ name = "buffer" },
					}),
				})

				cmp.setup.cmdline({ "/", "?" }, {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "buffer" },
					},
				})

				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = "path" },
					}, {
						{ name = "cmdline" },
					}),
					matching = { disallow_symbol_nonprefix_matching = false },
				})

				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end,
		},
		-- {
		-- 	"saghen/blink.cmp",
		-- 	-- optional: provides snippets for the snippet source
		-- 	dependencies = { "rafamadriz/friendly-snippets" },
		--
		-- 	-- use a release tag to download pre-built binaries
		-- 	version = "1.*",
		-- 	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- 	-- build = 'cargo build --release',
		-- 	-- If you use nix, you can build from source using latest nightly rust with:
		-- 	-- build = 'nix run .#build-plugin',
		--
		-- 	---@module 'blink.cmp'
		-- 	---@type blink.cmp.Config
		-- 	opts = {
		-- 		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 		-- 'enter' for enter to accept
		-- 		-- 'none' for no mappings
		-- 		--
		-- 		-- All presets have the following mappings:
		-- 		-- C-space: Open menu or open docs if already open
		-- 		-- C-n/C-p or Up/Down: Select next/previous item
		-- 		-- C-e: Hide menu
		-- 		-- C-k: Toggle signature help (if signature.enabled = true)
		-- 		--
		-- 		-- See :h blink-cmp-config-keymap for defining your own keymap
		-- 		keymap = { preset = "default" },
		--
		-- 		appearance = {
		-- 			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- 			-- Adjusts spacing to ensure icons are aligned
		-- 			nerd_font_variant = "mono",
		-- 		},
		--
		-- 		-- (Default) Only show the documentation popup when manually triggered
		-- 		completion = { documentation = { auto_show = false } },
		--
		-- 		-- Default list of enabled providers defined so that you can extend it
		-- 		-- elsewhere in your config, without redefining it, due to `opts_extend`
		-- 		sources = {
		-- 			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		-- 			providers = {
		-- 				lazydev = {
		-- 					name = "LazyDev",
		-- 					module = "lazydev.integrations.blink",
		-- 					-- make lazydev completions top priority (see `:h blink.cmp`)
		-- 					score_offset = 100,
		-- 				},
		-- 			},
		-- 		},
		--
		-- 		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- 		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- 		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		-- 		--
		-- 		-- See the fuzzy documentation for more information
		-- 		fuzzy = { implementation = "prefer_rust_with_warning" },
		-- 	},
		-- 	opts_extend = { "sources.default" },
		-- },
		-- {
		--   "petertriho/cmp-git",
		--   ft = { "gitcommit" },
		--   dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" },
		--   config = function()
		--     require("cmp_git").setup()
		--     local cmp = require("cmp")
		--     cmp.setup.filetype("gitcommit", {
		--       sources = cmp.config.sources({ { name = "git" } }, { { name = "buffer" } }),
		--     })
		--   end,
		-- },
	},
}
