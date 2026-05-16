return {
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      cursor_color = "#8b5cf6",
      normal_bg = "#08090d",
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      smear_insert_mode = true,
      smear_to_cmd = true,
      scroll_buffer_space = true,
      legacy_computing_symbols_support = true,
      time_interval = 8,
      delay_event_to_smear = 0,
      delay_after_key = 1,
      stiffness = 0.92,
      trailing_stiffness = 0.72,
      anticipation = 0.55,
      damping = 0.74,
      trailing_exponent = 2,
      distance_stop_animating = 0.04,
      stiffness_insert_mode = 0.86,
      trailing_stiffness_insert_mode = 0.7,
      damping_insert_mode = 0.78,
      trailing_exponent_insert_mode = 1,
      max_length = 18,
      max_length_insert_mode = 6,
      never_draw_over_target = true,
      hide_target_hack = true,
      filetypes_disabled = {
        "neo-tree",
        "snacks_picker_input",
        "TelescopePrompt",
        "lazy",
        "mason",
      },
    },
    keys = {
      {
        "<leader>uS",
        function()
          require("smear_cursor").toggle()
        end,
        desc = "Toggle Cursor Blaze",
      },
    },
  },
}
