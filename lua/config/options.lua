local lspconfig = require("lspconfig")

-- local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local function hasProperty(object, prop)
	return object[prop] ~= nil
end

