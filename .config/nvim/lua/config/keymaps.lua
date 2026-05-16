-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Personal editing helpers only. LazyVim already owns <leader>c, <leader>d,
-- <leader>u, diagnostics, formatting and quit mappings.
map("n", "<leader>yP", '"0p', { desc = "Paste Register 0" })
map("v", "<leader>yP", '"0p', { desc = "Paste Register 0" })
map({ "n", "v" }, "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format" })
