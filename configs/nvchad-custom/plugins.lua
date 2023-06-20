local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
      dependencies = {
        "joechrisellis/lsp-format-modifications.nvim",
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",

        "cpp",
        "c",
        "python",

        "bash",
        "cmake",
        "make",
        "starlark",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "buf",
        "buildifier",
        "clangd",
        "clang-format",
        "cpplint",
        "cmakelang",
        "cmakelint",
        "lua-language-server",
        "yapf",
      },
    },
  },
  -- {
  --   "ray-x/lsp_signature.nvim",
  -- },
  {
    "lvimuser/lsp-inlayhints.nvim",
    branch = "anticonceal"
  },
  {
    "p00f/clangd_extensions.nvim",
  },
}

return plugins
