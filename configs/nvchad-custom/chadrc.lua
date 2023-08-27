---@type ChadrcConfig
local M = {}
M.ui = { theme = "ayu_dark" }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
vim.opt.swapfile = false
return M
