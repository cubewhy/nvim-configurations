local lspconfig = require("lspconfig")

-- local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- auto setup installed lsp
for _, server in pairs(mason_lspconfig.get_installed_servers()) do
	lspconfig[server].setup({})
end
