return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp",
    init = function()
      vim.g.copilot_nes_debounce = 500
    end,
  },
  opts = {
    suggestion = {
      autotrigger = true,
    },
    nes = {
      enabled = true,
      autotrigger = true,
      debounce = 75,

      keymap = {
        accept_and_goto = "<M-tab>",
        accept = false,
        dismiss = "<Esc>",
      },
    },
    asdf = {
      enabled = true,
    },
  },
  keys = {
    {
      -- This let's us accept the Copilot NES suggestion and go to the next one with Meta+Tab
      -- in insert & normal mode.
      "<M-tab>",
      function()
        local nes_api = require("copilot.nes.api")
        local result = nes_api.nes_apply_pending_nes()
        if result then
          return nes_api.nes_walk_cursor_end_edit()
        end
      end,
      mode = "i",
      desc = "Accept Copilot NES and Go-To",
      expr = true,
      noremap = true,
    },
  },
}
