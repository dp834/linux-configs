M = {}

M.disabled = {
  n = {
    ["<leader>h"] = "",
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint to line" },
    ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },
    ["<F5>"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },
    ["<F8>"] = { "<cmd> DapStepInto <CR>", "Step into next function" },
    ["<F9>"] = { "<cmd> DapStepOver<CR>", "Step Over next function" },
    ["<F10>"] = { "<cmd> DapStepOut <CR>", "Step Out of current function" },
    ["<leader>dt"] = { "<cmd> lua require('dapui').toggle() <CR>", "Toggle Debug UI" },
  },
}

M.manual = {
  n = {
    ["<leader>hs"] = { "<cmd> Gitsigns stage_hunk <CR>", "Stage hunk" },
    ["<leader>hr"] = { "<cmd> Gitsigns reset_hunk <CR>", "Reset hunk" },
    ["<leader>hu"] = { "<cmd> Gitsigns undo_stage_hunk <CR>", "Undo stage hunk" },
    ["<leader>hR"] = { "<cmd> Gitsigns reset_buffer <CR>", "git reset this buffer" },
    ["<leader>hd"] = { "<cmd> Gitsigns diffthis <CR>", "git diff buffer" },
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
