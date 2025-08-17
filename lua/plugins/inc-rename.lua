vim.keymap.set("n", "<leader>cr", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Rename symbol under cursor" })

return {
  "smjonas/inc-rename.nvim",
}
