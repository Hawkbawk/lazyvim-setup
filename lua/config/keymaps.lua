-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

vim.api.nvim_set_keymap("t", "<esc>", "<C-\\><C-n><cmd>q<cr>", { noremap = true })

wk.register({
  f = {
    name = "Find",
    f = { "<cmd>Telescope fd<cr>", "Find Files" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  },
}, {
  prefix = "<leader>",
  nnoremap = true,
})
