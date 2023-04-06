return {
  -- Toggleterm for a better terminal experience.
  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      terminal_mappings = true,
      direction = "float",
      auto_scroll = true,
      autochdir = false,
    },
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<CR>", "Open Terminal" },
    },
    cmd = { "ToggleTerm" },
  },
}
