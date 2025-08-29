return {
	"cubewhy/edgy.nvim",
	event = "VeryLazy",
	init = function()
		vim.opt.laststatus = 3
		vim.opt.splitkeep = "screen"
	end,
	opts = {
		options = {
			left = { size = 40 },
			bottom = { size = 10 },
			right = { size = 30 },
			top = { size = 10 },
		},
		animate = {
			enabled = false,
			fps = 100, -- frames per second
			cps = 120, -- cells per second
			on_begin = function()
				vim.g.minianimate_disable = true
			end,
			on_end = function()
				vim.g.minianimate_disable = false
			end,
			-- Spinner for pinned views that are loading.
			-- if you have noice.nvim installed, you can use any spinner from it, like:
			-- spinner = require("noice.util.spinners").spinners.circleFull,
			spinner = {
				frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
				interval = 80,
			},
		},
		-- buffer-local keymaps to be added to edgebar buffers.
		-- Existing buffer-local keymaps will never be overridden.
		-- Set to false to disable a builtin.
		---@type table<string, fun(win:Edgy.Window)|false>
		keys = {
			-- close window
			["q"] = function(win)
				win:close()
			end,
			-- hide window
			["<c-q>"] = function(win)
				win:hide()
			end,
			-- close sidebar
			["Q"] = function(win)
				win.view.edgebar:close()
			end,
			-- next open window
			["]w"] = function(win)
				win:next({ visible = true, focus = true })
			end,
			-- previous open window
			["[w"] = function(win)
				win:prev({ visible = true, focus = true })
			end,
			-- next loaded window
			["]W"] = function(win)
				win:next({ pinned = false, focus = true })
			end,
			-- prev loaded window
			["[W"] = function(win)
				win:prev({ pinned = false, focus = true })
			end,
			-- increase width
			["<C-Right>"] = function(win)
				local props = vim.api.nvim_win_get_config(win:native_window())
				if props.split == "left" or props.split == "above" then
					-- increase width
					win:resize("width", 2)
				elseif props.split == "right" then
					-- decrease width
					win:resize("width", -2)
				end
			end,
			-- decrease width
			["<C-Left>"] = function(win)
				local props = vim.api.nvim_win_get_config(win:native_window())
				if props.split == "left" or props.split == "above" then
					-- decrease width
					win:resize("width", -2)
				elseif props.split == "right" then
					-- increase width
					win:resize("width", 2)
				end
			end,
			["<C-Up>"] = function(win)
				local props = vim.api.nvim_win_get_config(win:native_window())
				if props.split == "below" then
					-- increase height
					win:resize("height", 2)
				elseif props.split == "above" then
					-- decrease height
					win:resize("height", -2)
				end
			end,
			["<C-Down>"] = function(win)
				local props = vim.api.nvim_win_get_config(win:native_window())
				if props.split == "below" then
					-- decrease height
					win:resize("height", -2)
				elseif props.split == "above" then
					-- increase height
					win:resize("height", 2)
				end
			end,
			-- reset all custom sizing
			["<c-w>="] = function(win)
				win.view.edgebar:equalize()
			end,
		},
		bottom = {
			-- toggleterm / lazyterm at the bottom with a height of 40% of the screen
			{
				ft = "toggleterm",
				size = { height = 0.4 },
				-- exclude floating windows
				filter = function(buf, win)
					local props = vim.api.nvim_win_get_config(win)
					return props.relative == "" and props.split == "below"
				end,
			},
			{
				ft = "lazyterm",
				title = "LazyTerm",
				size = { height = 0.4 },
				filter = function(buf)
					return not vim.b[buf].lazyterm_cmd
				end,
			},
			{
				ft = "",
				title = "Terminal",
				filter = function(buf, win)
					local props = vim.api.nvim_win_get_config(win)
					return props.split == "below" and vim.bo[buf].buftype == "terminal"
				end,
			},
			{
				ft = "trouble",
				title = "Trouble",
				filter = function(buf, win)
					local props = vim.api.nvim_win_get_config(win)
					return props.split == "below"
				end,
			},
			{ ft = "qf",            title = "QuickFix" },
			{
				ft = "help",
				size = { height = 20 },
				-- only show help buffers
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
			{ ft = "spectre_panel", size = { height = 0.4 } },
		},
		left = {
			-- Neo-tree filesystem always takes half the screen height
			{
				title = "Neo-Tree",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "filesystem"
				end,
				size = { height = 0.5 },
			},
			-- {
			-- 	title = "Watches",
			-- 	ft = "dapui_watches",
			-- },
			-- {
			-- 	title = "Stacks",
			-- 	ft = "dapui_stacks",
			-- },
			-- {
			-- 	title = "Breakpoints",
			-- 	ft = "dapui_breakpoints",
			-- },
			-- {
			-- 	title = "Scopes",
			-- 	ft = "dapui_scopes"
			-- },
			"neo-tree",
		},
		right = {
			{
				ft = "toggleterm",
				size = { height = 0.4 },
				-- exclude floating windows
				filter = function(buf, win)
					local props = vim.api.nvim_win_get_config(win)
					return props.relative == "" and props.split == "right"
				end,
			},
			{
				ft = "trouble",
				title = "Trouble",
				filter = function(buf, win)
					local props = vim.api.nvim_win_get_config(win)
					return props.split == "right"
				end,
			},
		},
	},
}
