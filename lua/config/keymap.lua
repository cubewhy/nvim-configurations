local map = vim.keymap.set

-- some parts of this file is from https://www.lazyvim.org/configuration/general

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- -- location list
-- map("n", "<leader>xl", function()
-- 	local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
-- 	if not success and err then
-- 		vim.notify(err, vim.log.levels.ERROR)
-- 	end
-- end, { desc = "Location List" })
--
-- -- quickfix list
-- map("n", "<leader>xq", function()
-- 	local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
-- 	if not success and err then
-- 		vim.notify(err, vim.log.levels.ERROR)
-- 	end
-- end, { desc = "Quickfix List" })

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix", silent = true })
-- map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix", silent = true })

for i = string.byte("a"), string.byte("z") do
  local m = string.char(i)
  vim.keymap.set("n", "dm'" .. m, function()
    vim.cmd("delmarks " .. m)
  end, { silent = true, desc = "Delete mark with name " .. m })
end
