return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      trigger = {
        show_on_accept_on_trigger_character = true,
      },
      list = {
        selection = { preselect = false, auto_insert = true },
      },
      menu = {
        draw = {
          columns = {
            { "label" },
            { "kind_icon", "kind", gap = 1 },
            { "source_name" },
          },
          components = {
            source_name = {
              width = { max = 30 },
              text = function(ctx)
                return "[" .. ctx.source_name .. "]"
              end,
              highlight = "BlinkCmpSource",
            },
          },
        },
      },
    },
    sources = {
      min_keyword_length = 3,
    },
    keymap = {
      preset = "super-tab",

      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-d>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-m>"] = { "show_signature", "hide_signature", "fallback" },
    },
  },
}
