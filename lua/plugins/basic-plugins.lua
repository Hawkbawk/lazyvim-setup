-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore

-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  -- Fugitive for a better git experience
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gedit",
      "Gsplit",
    }
  },
}
