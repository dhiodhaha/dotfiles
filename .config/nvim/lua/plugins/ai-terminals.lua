return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>ac",
        function()
          Snacks.terminal({ "codex" }, { win = { position = "right", width = 0.42 } })
        end,
        desc = "Codex",
      },
      {
        "<leader>aC",
        function()
          Snacks.terminal({ "codex", "resume" }, { win = { position = "right", width = 0.42 } })
        end,
        desc = "Codex Resume",
      },
      {
        "<leader>aa",
        function()
          Snacks.terminal({ "claude" }, { win = { position = "right", width = 0.42 } })
        end,
        desc = "Claude Code",
      },
      {
        "<leader>aA",
        function()
          Snacks.terminal({ "claude", "--continue" }, { win = { position = "right", width = 0.42 } })
        end,
        desc = "Claude Continue",
      },
      {
        "<leader>az",
        function()
          Snacks.terminal({ "zsh" }, { win = { position = "float" } })
        end,
        desc = "Floating Shell",
      },
    },
  },
}
