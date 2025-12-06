return {
  "folke/sidekick.nvim",
  keys = {
    {
      "<leader>as",
      function()
        require("sidekick.cli").select({ filter = { installed = true } })
      end,
      desc = "Select CLI",
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Toggle CLI",
    },
  },
}
