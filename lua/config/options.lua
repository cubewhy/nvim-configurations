local lspconfig = require("lspconfig")

-- local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local function hasProperty(object, prop)
	return object[prop] ~= nil
end

-- enable folding for lsp servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
	require("lspconfig")[ls].setup({
		capabilities = capabilities,
		-- you can add other fields for setting up lsp server in this table
	})
end
require("ufo").setup()
