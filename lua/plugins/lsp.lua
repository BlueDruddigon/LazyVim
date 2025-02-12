return {
  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- python type stubs
      "microsoft/python-type-stubs",
      -- python typeshed
      "python/typeshed",
    },
    opts = {
      codelens = { enabled = true },
      server = {
        basedpyright = {
          settings = {
            basedpyright = {
              openFilesOnly = true,
              analysis = {
                logLevel = "Trace",
                stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
                extraPaths = {},
                typeshedPaths = { vim.fn.stdpath("data") .. "/lazy/typeshed" },
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                autoImportCompletions = true,
              },
            },
          },
        },
      },
    },
  },

  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },

  -- vscode-like winbar
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      create_autocmd = false,
    },
    config = function(_, opts)
      require("barbecue").setup(opts)

      vim.api.nvim_create_autocmd({ "WinScrolled", "BufWinEnter", "CursorHold", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("barbecue,updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
  },
}
