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

  -- editable formatters
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    opts = function(_, opts)
      opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
        ruff_organize_imports = {
          args = {
            "check",
            "--fix",
            "--force-exclude",
            "--select=I",
            "--exit-zero",
            "--no-cache",
            "--stdin-filename",
            "$FILENAME",
            "-",
          },
          condition = function(_)
            return vim.fn.executable("ruff")
          end,
        },
      })
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
        python = { "ruff_organize_imports", "ruff_format", "yapf" },
      })
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
