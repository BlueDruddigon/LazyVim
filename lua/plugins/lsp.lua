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
}
