return {
  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = { delay = 100 },
      current_line_blame_formatter = " <author>, <author_time:%d-%m-%Y> - <summary>",
      preview_config = { border = "rounded" },
    },
  },

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    opts = {
      focus = true,
      auto_close = true,
      keys = {
        ["<CR>"] = "jump_close",
        ["o"] = "jump",
      },
      warn_no_results = false,
      modes = {
        cascade = {
          mode = "diagnostics",
          filter = function(items)
            local severity = vim.diagnostic.severity.HINT
            for _, item in ipairs(items) do
              severity = math.min(severity, item.severity)
            end
            return vim.tbl_filter(function(item)
              return item.severity == severity
            end, items)
          end,
        },
      },
    },
    keys = {
      { "ge", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "(Trouble) Document Diagnostics" },
      { "gE", "<CMD>Trouble diagnostics toggle<CR>", desc = "(Trouble) Workspace Diagnostics" },
      { "gq", "<CMD>Trouble qflist toggle<CR>", desc = "(Trouble) Quickfix List" },
    },
  },

  -- commenters
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
      ignore = "^$",
      toggler = { line = ",," },
      opleader = { line = ",," },
      pre_hook = function(...)
        local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
        if loaded and ts_comment then
          return ts_comment.create_pre_hook()(...)
        end
      end,
    },
    keys = {
      { ",,", mode = { "n", "v" } },
    },
  },

  -- colorizer
  { "NvChad/nvim-colorizer.lua", event = "VeryLazy", config = true },
}
