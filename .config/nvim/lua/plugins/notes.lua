return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = "catatandhafin",
          path = "/mnt/c/Users/dopamine/Documents/catatandhafin",
        },
        {
          name = "local-notes",
          path = vim.fn.expand("~/notes"),
        },
      },
      completion = {
        nvim_cmp = false,
        blink = true,
      },
      picker = {
        name = "snacks.pick",
      },
      notes_subdir = "_Inbox",
      new_notes_location = "notes_subdir",
      daily_notes = {
        folder = "_Inbox/Daily",
        date_format = "%Y-%m-%d",
      },
      ui = {
        enable = false,
      },
    },
    keys = {
      { "<leader>on", "<cmd>Obsidian new<cr>", desc = "New Note" },
      { "<leader>oo", "<cmd>Obsidian quick_switch<cr>", desc = "Open Note" },
      { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Search Notes" },
      { "<leader>od", "<cmd>Obsidian today<cr>", desc = "Daily Note" },
      { "<leader>ol", "<cmd>Obsidian links<cr>", desc = "Note Links" },
    },
  },
}
