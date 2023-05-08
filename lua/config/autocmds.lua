-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Setup autoformat on save
local lsp_group = vim.api.nvim_create_augroup("LspGroup", { clear = true })
local easy_quit_group = vim.api.nvim_create_augroup("EasyQuitGroup", { clear = true })
vim.api.nvim_clear_autocmds({ group = lsp_group, buffer = bufnr })

vim.api.nvim_clear_autocmds({ group = easy_quit_group, buffer = bufnr })
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "TelescopePrompt",
    "man",
    "help",
    "log",
    "git",
  },
  buffer = bufnr,
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "i", "<ESC>", "<ESC><cmd>q!<cr>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "<ESC>", "<ESC><cmd>q!<cr>", { noremap = true })
  end,
})

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  -- THIS IS FOR BUILTIN LSP
  vim.diagnostic.open_float({
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end

-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})
