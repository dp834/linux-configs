local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- We handle clangd with another extension
local servers = {"cmake", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local utils = require "core.utils"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("clangd_extensions").setup({
  server = {
    on_attach = function(_,bufnr)
      utils.load_mappings("lspconfig", { buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre",{
        group = augroup,
        buffer = bufnr,
        callback = function ()
        vim.lsp.buf.format { async = true }
      end,
    })
    end
  },
  extensions = {
    autoSetHints = true,
  },
})

