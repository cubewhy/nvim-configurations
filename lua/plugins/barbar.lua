local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", { noremap = true, silent = true, desc = "Goto first buffer" })
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", { noremap = true, silent = true, desc = "Goto second buffer" })
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", { noremap = true, silent = true, desc = "Goto third buffer" })
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", { noremap = true, silent = true, desc = "Goto fourth buffer" })
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", { noremap = true, silent = true, desc = "Goto fifth buffer" })
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", { noremap = true, silent = true, desc = "Goto sixth buffer" })
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", { noremap = true, silent = true, desc = "Goto seventh buffer" })
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", { noremap = true, silent = true, desc = "Goto eighth buffer" })
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", { noremap = true, silent = true, desc = "Goto nineth buffer" })
map("n", "<A-0>", "<Cmd>BufferLast<CR>", { noremap = true, silent = true, desc = "Goto last buffer" })

-- Pin/unpin buffer
map("n", "<leader>bp", "<Cmd>BufferPin<CR>", { noremap = true, silent = true, desc = "Pin current buffer" })

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", { noremap = true, silent = true, desc = "Close current buffer" })

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
map("n", "<leader>bp", "<Cmd>BufferPick<CR>", { noremap = true, silent = true, desc = "Magic buffer-picking" })
map("n", "<leader>bP", "<Cmd>BufferPickDelete<CR>", { noremap = true, silent = true, desc = "Magic buffer-deleting" })

-- Sort automatically by...
map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", { noremap = true, silent = true, desc = "Reorder buffer by buffer number" })
map("n", "<leader>bn", "<Cmd>BufferOrderByName<CR>", { noremap = true, silent = true, desc = "Reorder buffer by name" })
map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", { noremap = true, silent = true, desc = "Reorder buffer by directory" })
map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", { noremap = true, silent = true, desc = "Reorder buffer by language" })
map("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", { noremap = true, silent = true, desc = "Reorder buffer by window number" })

return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
