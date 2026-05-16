-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- Keep this file small: LazyVim already sets the common editor defaults.
opt.wrap = false
opt.scrolloff = 8

vim.g.autoformat = true
vim.g.lazyvim_picker = "snacks"
vim.g.lazyvim_cmp = "blink.cmp"
