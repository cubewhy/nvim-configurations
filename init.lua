vim.opt.guifont = "JetBrains Mono,DejaVu Sans Mono,Iosevka:h12"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.number = true
vim.wo.relativenumber = true

vim.o.tabstop = 4
vim.wo.wrap = false
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.opt.cursorline = true

-- vim.g.neovide_opacity = 0.75
-- vim.g.neovide_normal_opacity = 0.75
--
-- vim.g.neovide_window_blurred = true

require("config.lazy")

