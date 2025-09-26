return {
  "amitds1997/remote-nvim.nvim",
  version = "*", -- Pin to GitHub releases
  dependencies = {
    "nvim-lua/plenary.nvim", -- For standard functions
    "MunifTanjim/nui.nvim", -- To build the plugin UI
    "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
  },
  opts = {
    client_callback = function(port, workspace_config)
      local cmd = string.format(
        "zellij action new-tab --name 'remote-nvim:%s' -- nvim --server localhost:%s --remote-ui",
        workspace_config.host,
        port
      )
      vim.fn.jobstart(cmd, { detach = true })
    end,
  },
}
