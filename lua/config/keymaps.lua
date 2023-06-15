-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
local telescope = require("telescope.builtin")

vim.api.nvim_set_keymap("t", "<esc>", "<C-\\><C-n><cmd>q<cr>", { noremap = true })

wk.register({
  f = {
    name = "Find",
    f = {
      function()
        telescope.find_files({
          find_command = { "rg", "--files", "--hidden", "--follow", "--no-ignore-vcs", "-g", "!.git" },
          hidden = true,
          no_ignore = true,
        })
      end,
      "Find Files",
    },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  },
}, {
  prefix = "<leader>",
  mode = "n",
  nnoremap = true,
  silent = true,
})
