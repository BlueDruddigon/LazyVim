return {
  "folke/snacks.nvim",
  opts = {
    explorer = {},
    picker = {
      layouts = {
        sidebar = {
          layout = {
            width = 25,
            min_width = 25,
          },
        },
      },
      sources = {
        explorer = {
          layout = { preset = "sidebar" },
          auto_close = true,
        },
      },
    },
  },
}
