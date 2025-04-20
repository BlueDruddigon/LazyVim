return {
  "kawre/leetcode.nvim",
  cmd = "Leet",
  dependencies = {
    -- "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        vim.tbl_deep_extend("force", opts.ensure_installed, { "html" })
        return opts
      end,
    },
  },
  opts = function()
    return {
      storage = {
        home = os.getenv("HOME") .. "/OneDrive - shareofficeedu/haibh/dev/algorithms/leetcode",
      },
    }
  end,
}
