return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      clangd = function(_, opts)
        opts.init_options.fallbackFlags = { "--std=c++20" }
        opts.capabilities.offsetEncoding = { "utf-16" }
      end,
    },
  },
}
