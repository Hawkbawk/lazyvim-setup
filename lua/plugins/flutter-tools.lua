return {
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    cmd = {
      "FlutterRun",
      "FlutterDevices",
      "FlutterEmulators",
      "FlutterReload",
      "FlutterRestart",
      "FlutterQuit",
      "FlutterDetach",
      "FlutterOutlineToggle",
      "FlutterOutlineOpen",
      "FlutterDevTools",
      "FlutterDevToolsActivate",
      "FlutterCopyProfilerUrl",
      "FlutterLspRestart",
      "FlutterSuper",
      "FlutterReanalyze",
    },
    opts = {
      decorations = {
        statusline = {
          -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
          -- this will show the current version of the flutter app from the pubspec.yaml file
          app_version = false,
          -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
          -- this will show the currently running device if an application was started with a specific
          -- device
          device = false,
        },
      },
      debugger = {
        -- integrate with nvim dap + install dart code debugger
        enabled = true,
        run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
        -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
        -- see |:help dap.set_exception_breakpoints()| for more info
        exception_breakpoints = {},
        register_configurations = function()
          require("dap").configurations.dart = {
            {
              type = "dart",
              request = "launch",
              name = "Run Flutter App",
              program = "${workspaceFolder}/lib/main.dart",
              cwd = "${workspaceFolder}",
            },
            {
              type = "dart",
              request = "launch",
              name = "Run Family Game Night",
              program = "${workspaceFolder}/Flutter/lib/main.dart",
              cwd = "${workspaceFolder}/Flutter",
            },
          }
        end,
      },
    },
    event = "BufEnter *.dart",
  },
}
