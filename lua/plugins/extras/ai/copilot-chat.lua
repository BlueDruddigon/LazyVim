return {
  -- copilot chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "folke/which-key.nvim",
      opts = {
        spec = {
          { "<leader>gc", group = "copilot", icon = { icon = "", color = "cyan" } },
          { "<leader>gcc", group = "chat", icon = { icon = "󱋊", color = "cyan" } },
        },
      },
    },
    opts = function()
      local select = require("CopilotChat.select")
      return {
        model = "claude-sonnet-4",
        window = {
          layout = "float",
          relative = "editor",
          width = 0.8,
          height = 0.8,
          border = "rounded",
        },
        prompts = {
          Comments = {
            prompt = "/COPILOT_REFACTOR Add comments to the code.",
            mapping = "<leader>gcc",
            description = "(Copilot) Add comments to current code",
            selection = select.visual,
          },
        },
      }
    end,
    keys = {
      { "<leader>gcd", mode = { "n", "v" }, "<CMD>CopilotChatDocs<CR>", desc = "(Copilot) Generate Docs" },
      { "<leader>gce", mode = { "n", "v" }, "<CMD>CopilotChatExplain<CR>", desc = "(Copilot) Explain Code" },
      { "<leader>gcf", mode = { "n", "v" }, "<CMD>CopilotChatFixDiagnostic<CR>", desc = "(Copilot) Fix Bug" },
      { "<leader>gcs", "<CMD>CopilotChatCommitStaged<CR>", desc = "(Copilot) Commit Staged" },
      { "<leader>gcc", desc = "(Copilot) Add comments" },
      { "<leader>gca", "<CMD>CopilotChatAgents<CR>", desc = "(Copilot) Select Agents" },
      { "<leader>gcm", "<CMD>CopilotChatModels<CR>", desc = "(Copilot) Select Models" },
      {
        "<leader>gccs",
        mode = { "n", "v" },
        function()
          local name = vim.fn.input("Chat name to be saved: ")
          if name ~= "" then
            require("CopilotChat").save(name)
          end
        end,
        desc = "(Copilot) Save Chat",
      },
      {
        "<leader>gccl",
        mode = { "n", "v" },
        function()
          local name = vim.fn.input("Chat name to be loaded: ")
          if name ~= "" then
            require("CopilotChat").load(name)
          end
        end,
        desc = "(Copilot) Load Chat",
      },
      {
        "<leader>gco",
        mode = { "n", "v" },
        "<CMD>CopilotChatOptimize<CR>",
        desc = "(Copilot) Optimize Selected Code",
      },
      { "<leader>gct", "<CMD>CopilotChatToggle<CR>", desc = "(Copilot) Toggle Chat Window" },
      { "<leader>gcr", "<CMD>CopilotChatReset<CR>", desc = "(Copilot) Reset Chat Window" },
      {
        "<leader>gcq",
        mode = "v",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
          end
        end,
        desc = "(Copilot) Quick Chat with Visual",
      },
    },
  },
}
