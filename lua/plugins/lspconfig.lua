return {
  -- Setup lspconfig with all the desired LSPs.
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        dartls = {},
        rust_analyzer = {},
        solargraph = {},
        omnisharp = {},
        lua_ls = {},
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "gd", "<cmd>lua require('fzf-lua').lsp_definitions()<cr>", desc = "Go-To Definitions" }
      keys[#keys + 1] = { "gr", "<cmd>lua require('fzf-lua').lsp_references()<cr>", desc = "Go-To References" }
      keys[#keys + 1] =
        { "gi", "<cmd>lua require('fzf-lua').lsp_implementations()<cr>", desc = "Go-To Implementations" }
    end,
  },
  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },
  -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
}
