-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Setup autoformat on save
local lsp_group = vim.api.nvim_create_augroup("LspGroup", { clear = true })
local easy_quit_group = vim.api.nvim_create_augroup("EasyQuitGroup", { clear = true })
vim.api.nvim_clear_autocmds({ group = lsp_group, buffer = bufnr })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = lsp_group,
  buffer = bufnr,
  callback = function()
    vim.lsp.buf.format({ bufnr = bufnr })
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = {
          "source.organizeImports",
        },
      },
    })
  end,
})

vim.api.nvim_clear_autocmds({ group = easy_quit_group, buffer = bufnr })
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "TelescopePrompt",
    "man",
    "help",
    "log",
  },
  buffer = bufnr,
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "i", "<ESC>", "<ESC><cmd>q!<cr>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "<ESC>", "<ESC><cmd>q!<cr>", { noremap = true })
  end,
})
