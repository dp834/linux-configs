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
        "cmakelang",
        "cmakelint",
        "codelldb",
        "cmake-language-server",
        "lua-language-server",
        "prettier",
        "stylua",
        "yapf",
      },
    },
  },
  -- {
  --   "ray-x/lsp_signature.nvim",
  -- },
  {
    "lvimuser/lsp-inlayhints.nvim",
    branch = "anticonceal",
  },
  {
    "p00f/clangd_extensions.nvim",
  },
  {
    "pwntester/octo.nvim",
    -- load only if in a git repo
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    lazy = false,
    config = function()
      require("copilot").setup {
        -- Possible configurable fields can be found on:
        -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
        suggestion = {
          enable = false,
        },
        panel = {
          enable = false,
        },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      },
    },
  },
}

return plugins
