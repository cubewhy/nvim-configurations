vim.wo.winbl = 40

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "DapBreakpointColor", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🛑", texthl = "DapBreakpointConditionColor", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "DapLogPointColor", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStoppedColor", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🚫", texthl = "DapBreakpointRejectedColor", linehl = "", numhl = "" })
