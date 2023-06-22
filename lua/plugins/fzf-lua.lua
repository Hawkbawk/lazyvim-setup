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
      {
        "<leader>fs",
        "<cmd>lua require('fzf-lua').lsp_document_symbols()<cr>",
        desc = "Document Symbols",
      },
      {
        "<leader>fS",
        "<cmd>lua require('fzf-lua').lsp_workspace_symbols()<cr>",
        desc = "Workspace Symbols",
      },
      {
        "<leader>ca",
        "<cmd>lua require('fzf-lua').lsp_code_actions()<cr>",
        desc = "Code Actions",
      },
      -- Additional keymaps are defined in `lua/plugins/lspconfig.lua`, as they're setup
      -- when the LSP attaches
    },
  },
}
