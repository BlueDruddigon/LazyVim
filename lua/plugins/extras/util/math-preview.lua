return {
  "jbyuki/nabla.nvim",
  keys = {
    {
      "<leader>mp",
      function()
        return require("nabla").popup({ border = "rounded" })
      end,
      desc = "(Math) Preview Math Formulas",
    },
  },
  dependencies = {
    {
      "folke/which-key.nvim",
      opts = {
        spec = {
          { "<leader>m", group = "math", icon = { icon = "󰒠", color = "cyan" } },
        },
      },
    },
  },
}
