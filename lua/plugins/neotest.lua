return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest",
    "nvim-neotest/nvim-nio",
  },
  opts = {
    discover = {
      enabled = false,
    },
    adapters = {
      ["neotest-jest"] = {
        jestCommand = "npx jest --",
        cwd = function()
          return vim.fn.getcwd()
        end,
        env = {
          NODE_ENV = "test",
        },
      },
    },
  },
}
