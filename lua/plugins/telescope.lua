return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Search Help",
      },
    },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
