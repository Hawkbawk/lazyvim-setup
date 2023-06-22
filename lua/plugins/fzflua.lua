return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    opts = {
      "fzf-native",
      files = {
        fd_opts = "--color=never --type=f --hidden --no-ignore --follow --exclude .git --exclude node_modules",
      },
    },

    config = function(opts)
      require("fzf-lua").setup(opts)
    end,

    cmd = "FzfLua",
    keys = {
      {
        "<leader>ff",
        "<cmd>lua require('fzf-lua').files()<cr>",
        desc = "Find Files",
      },
      {
        "<leader><leader>",
        "<cmd>lua require('fzf-lua').files()<cr>",
        desc = "Find Files",
      },
      {
        "<leader>fh",
        "<cmd>lua require('fzf-lua').help_tags()<cr>",
        desc = "Find Help",
      },
      {
        "<leader>/",
        "<cmd>lua require('fzf-lua').live_grep()<cr>",
        desc = "Live Grep",
      },
      {
        "<leader>fb",
        "<cmd>lua require('fzf-lua').buffers()<cr>",
        desc = "Buffers",
      },
      {
        "<leader>fo",
        "<cmd>lua require('fzf-lua').oldfiles()<cr>",
        desc = "Old Files",
      },
      {
        "<leader>xq",
        "<cmd>lua require('fzf-lua').quickfix()<cr>",
        desc = "Quickfix",
      },
    },
  },
}
