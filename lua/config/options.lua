local lspconfig = require("lspconfig")

-- local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local function hasProperty(object, prop)
	return rawget(object, prop) ~= nil
end

-- auto setup installed lsp
for _, server in pairs(mason_lspconfig.get_installed_servers()) do
    if hasProperty(lspconfig, server) then
        lspconfig[server].setup({})
    end
end
