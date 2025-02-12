return {
  "craftzdog/solarized-osaka.nvim",
  priority = 1000,
  enabled = true,
  opts = {
    transparent = true,
    on_highlights = function(hl, _)
      hl.NormalFloat = { bg = "none" }
      hl.FloatBorder = { bg = "none" }
      hl.SnacksPickerBorder = { bg = "none" }
      hl.LspInlayHint = { fg = "#969696" }
    end,
  },
  dependencies = {
    {
      "folke/noice.nvim",
      opts = {
        lsp = {
          documentation = {
            opts = {
              win_options = {
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu",
              },
            },
          },
        },
      },
    },
  },
}
