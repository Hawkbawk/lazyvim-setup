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
        jestCommand = function(path)
          if string.find(path, "canvas%-lms") then
            return "yarn test:jest"
          else
            return "npx jest"
          end
        end,
        cwd = function()
          return vim.fn.getcwd()
        end,
        env = {
          NODE_ENV = "test",
        },
        isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
      },
    },
  },
}
