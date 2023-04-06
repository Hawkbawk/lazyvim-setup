return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      {
        "<leader>hm",
        "<cmd>lua require('harpoon.mark').add_file()<cr>",
        desc = "Mark File with harpoon",
      },
      {
        "<leader>hn",
        "<cmd>lua require('harpoon.ui').nav_next()<cr>",
        desc = "Next Harpoon Mark",
      },
      {
        "<leader>hn",
        "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
        desc = "Previous Harpoon Mark",
      },
      {
        "<leader>ha",
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
        desc = "View All Harpoon Marks",
      },
    },
  },
}
