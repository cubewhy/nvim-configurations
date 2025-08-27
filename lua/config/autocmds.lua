-- Some parts of this file is from https://www.lazyvim.org/configuration/general

local function augroup(name)
	return vim.api.nvim_create_augroup("qby_nvim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"checkhealth",
		"dbout",
		"gitsigns-blame",
		"grug-far",
		"help",
		"lspinfo",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
})

-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("man_unlisted"),
	pattern = { "man" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
	end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap_spell"),
	pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup("json_conceal"),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = augroup("auto_create_dir"),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Hacks for Neotree
-- Thanks https://github.com/rmagatti/auto-session/discussions/269
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.api.nvim_create_autocmd("User", {
	pattern = "PersistenceLoadPre",
	group = augroup("session-persistence"),
	callback = function()
		-- close all opened buffers
		vim.cmd([[BufferCloseAllButCurrent]])
		vim.cmd([[Neotree filesystem show]])
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "PersistenceSavePre",
	group = augroup("session-persistence"),
	callback = function()
		vim.cmd([[Neotree close]])
	end,
})

-- auto toggle ime
local function set_ime(args)
	if args.event:match("Enter$") then
		vim.g.neovide_input_ime = true
	else
		vim.g.neovide_input_ime = false
	end
end

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
	group = ime_input,
	pattern = "*",
	callback = set_ime,
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
	group = ime_input,
	pattern = "[/\\?]",
	callback = set_ime,
})

vim.api.nvim_create_autocmd({ "TermEnter", "TermLeave" }, {
	group = ime_input,
	pattern = "*",
	callback = set_ime,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	group = augroup("colorscheme"),
	callback = function()
		if vim.g.colors_name == "ayu" then
			vim.cmd("highlight LineNr guifg=#707070")
			-- vim.cmd("highlight WinSeparator guifg=#464646 guibg=NONE")
		end
	end,
})

local function set_winblend_all()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		pcall(vim.api.nvim_set_option_value, "winblend", 40, { win = win, scope = "local" })
	end
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = set_winblend_all,
})

vim.api.nvim_create_autocmd({ "WinNew", "BufWinEnter" }, {
	callback = function()
		pcall(vim.api.nvim_set_option_value, "winblend", 40, { win = 0, scope = "local" })
	end,
})
