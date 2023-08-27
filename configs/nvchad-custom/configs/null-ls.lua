local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier,
  formatting.stylua,
  formatting.clang_format,
  formatting.yapf,
  formatting.buf,
  formatting.buildifier,
  formatting.cmake_format,

  lint.shellcheck,
  lint.cmake_lint,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup {
  debug = false,
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end

    -- inlay hints
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
}
