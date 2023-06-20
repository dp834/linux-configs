local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- We handle clangd with another extension
local servers = {"clangd", "cmake", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require("clangd_extensions").setup({
  server = {
    on_attach = on_attach
  },
  extensions = {
    autoSetHints = true,
  },
})

