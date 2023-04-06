local debug_app = function()
  if vim.bo.filetype == "dart" then
    vim.cmd([[FlutterRun]])
  else
    require("dap").continue()
  end
end
return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    keys = {
      {
        "<leader>db",
        "<cmd>lua require('dap').toggle_breakpoint()<cr>",
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>du",
        "<cmd>lua require('dapui').toggle()<cr>",
        desc = "Open Debug UI",
      },
      {
        "<leader>db",
        "<cmd>FzfLua dap_breakpoints<cr>",
        desc = "List Breakpoints",
      },
      {
        "<leader>dc",
        debug_app,
        desc = "Continue/Start Debugging",
      },
    },
    config = function()
      require("dapui").setup()
      local dap, dapui = require("dap"), require("dapui")

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
    end,
  },
}
