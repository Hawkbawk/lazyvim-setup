return {
  {
    import = "lazyvim.plugins.extras.ui.mini-starter",
  },
  {
    "echasnovski/mini.starter",
    opts = function(opts)
      local logo = table.concat({
        "            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
        "            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ",
        "            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ",
        "            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ",
        "            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ",
        "            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           ",
      }, "\n")
      local starter = require("mini.starter")
      -- Shamelessly borrowed from https://www.lazyvim.org/plugins/extras/ui.mini-starter
      local pad = string.rep(" ", 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      opts.header = logo
      opts.items = {
        new_section("Find File", "FzfLua files", "FzfLua"),
        new_section("Recent Files", "FzfLua oldfiles", "FzfLua"),
        new_section("Grep", "FzfLua live_grep", "FzfLua"),
        new_section("Session", [[lua require("persistence").load()]], "Session"),
        new_section("Edit Config", "e $MYVIMRC", "Config"),
        new_section("Lazy", "Lazy", "Config"),
        new_section("New File", "ene | startinsert", "Built-In"),
        new_section("Quit", "qa", "Built-In"),
      }

      opts.content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "►", false),
        starter.gen_hook.aligning("center", "center"),
      }

      return opts
    end,
  },
}
