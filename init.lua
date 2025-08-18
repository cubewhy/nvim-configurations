vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.opt.number = true
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.wo.relativenumber = true

require("config.lazy")

vim.cmd([[colorscheme ayu]])

