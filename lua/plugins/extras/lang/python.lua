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

  -- environment switcher
  {
    "AckslD/swenv.nvim",
    commit = "c0fcb6e",
    dependencies = {
      {
        "folke/which-key.nvim",
        opts = {
          spec = {
            { "<leader>p", group = "python", icon = { icon = "", color = "cyan" } },
          },
        },
      },
      "plenary.nvim",
    },
    opts = {
      post_set_venv = function()
        vim.cmd("LspRestart")
      end,
    },
    keys = {
      {
        "<leader>pe",
        function()
          require("swenv.api").pick_venv()
        end,
        desc = "Choose Virtual Environment",
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python", "*.py" },
        callback = function()
          require("swenv.api").auto_venv()
        end,
      })
    end,
  },
}
