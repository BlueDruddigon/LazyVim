return {
  -- import resolution on rename
  {
    "alexpasmantier/pymple.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "stevearc/dressing.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    build = ":PympleBuild",
    opts = {
      logging = {
        file = {
          enabled = true,
          path = vim.fn.stdpath("data") .. "/pymple.log",
          max_lines = 1000,
        },
        level = "trace",
      },
    },
    config = function(_, opts)
      require("pymple").setup(opts)
    end,
  },
}
