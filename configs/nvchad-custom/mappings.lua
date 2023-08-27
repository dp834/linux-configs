local M = {}

M.disabled = {
  n = {
    ["<leader>h"] = "",
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
  },
}

M.manual = {
  n = {
    ["<leader>hs"] = { "<cmd>Gitsigns stage_hunk <CR>", "Stage hunk" },
    ["<leader>hr"] = { "<cmd>Gitsigns reset_hunk <CR>", "Reset hunk" },
    ["<leader>hu"] = { "<cmd>Gitsigns undo_stage_hunk <CR>", "Undo stage hunk" },
    ["<leader>hR"] = { "<cmd>Gitsigns reset_buffer <CR>", "Reset buffer" },
    ["<leader>gd"] = { "<cmd>Gitsigns diffthis <CR>", "Diff buffer" },
  },
  v = {
    ["<leader>hs"] = {
      function()
        require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      "Stage selected",
    },
    ["<leader>hr"] = {
      function()
        require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      "Reset selected",
    },
  },
}

return M
