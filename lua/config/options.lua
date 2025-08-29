vim.wo.winbl = 40

vim.diagnostic.config({ signs = true })
vim.opt.signcolumn = "yes"

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "DapBreakpointColor", linehl = "", numhl = "" })
vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "🛑", texthl = "DapBreakpointConditionColor", linehl = "", numhl = "" }
)
vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "DapLogPointColor", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStoppedColor", linehl = "", numhl = "" })
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "🚫", texthl = "DapBreakpointRejectedColor", linehl = "", numhl = "" }
)

local icons = {
  Error = " ",
  Warn  = " ",
  Hint  = "󰌵 ",
  Info  = " ",
}

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.Error,
      [vim.diagnostic.severity.WARN]  = icons.Warn,
      [vim.diagnostic.severity.HINT]  = icons.Hint,
      [vim.diagnostic.severity.INFO]  = icons.Info,
    },
    texthl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
    },
  },
})
