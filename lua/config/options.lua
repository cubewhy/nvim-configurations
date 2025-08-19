local lspconfig = require("lspconfig")

-- local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local function hasProperty(object, prop)
	return object[prop] ~= nil
end

-- auto setup installed lsp
for _, server in pairs(mason_lspconfig.get_installed_servers()) do
	-- if hasProperty(lspconfig, server) then
	--     lspconfig[string.gsub(server, "-", "_")].setup({})
	-- end

	if server == "kotlin_lsp" then
		-- skip register this server (this cannot be registered via lspconfig)
		goto continue
	end

	lspconfig[server].setup({})
	::continue::
end
