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
  formatting.autopep8,

  lint.shellcheck,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup {
  debug = false,
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
    -- local lsp_format_modifications = require"lsp-format-modifications"
    -- lsp_format_modifications.attach(client, bufnr, {format_on_save = true})
    -- require"lsp_signature".on_attach({},bufnr)

    -- inlay hints
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
}
