return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,
      color_overrides = {
        mocha = {
          base = "#08090d",
          mantle = "#0b0d12",
          crust = "#05060a",
          text = "#e6e8ef",
          subtext1 = "#c8ccd8",
          subtext0 = "#aeb4c2",
          overlay2 = "#8c93a3",
          overlay1 = "#747c8f",
          overlay0 = "#5c6475",
          surface2 = "#343a46",
          surface1 = "#252a34",
          surface0 = "#171b24",
          blue = "#5e6ad2",
          lavender = "#8b95ff",
          sapphire = "#6bdbff",
          sky = "#8be9ff",
          teal = "#5de4a7",
          green = "#5de4a7",
          yellow = "#f6c177",
          peach = "#ffb057",
          maroon = "#ff7a82",
          red = "#ef5f67",
          mauve = "#8b5cf6",
          pink = "#a78bfa",
          flamingo = "#d0bfff",
          rosewater = "#f4d8ff",
        },
      },
      custom_highlights = function(colors)
        return {
          CursorLine = { bg = colors.surface0 },
          Visual = { bg = "#2d3343" },
          Search = { fg = colors.base, bg = colors.yellow },
          IncSearch = { fg = colors.base, bg = colors.mauve },
          LineNr = { fg = colors.overlay0 },
          CursorLineNr = { fg = colors.lavender, bold = true },
          NormalFloat = { bg = colors.mantle },
          FloatBorder = { fg = colors.surface2, bg = colors.mantle },
        }
      end,
      integrations = {
        blink_cmp = true,
        gitsigns = true,
        mason = true,
        mini = true,
        native_lsp = { enabled = true },
        noice = true,
        notify = true,
        treesitter = true,
        which_key = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    dependencies = { "catppuccin/nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      local colors = require("catppuccin.palettes").get_palette("mocha")
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.mauve, guifg = colors.base },
            InclineNormalNC = { guifg = colors.overlay1, guibg = colors.surface0 },
          },
        },
        hide = {
          cursorline = true,
        },
        window = {
          margin = { vertical = 0, horizontal = 1 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon or "", guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        width = 0.88,
      },
      plugins = {
        gitsigns = true,
        tmux = false,
      },
    },
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local LazyVim = require("lazyvim.util")
      opts.sections.lualine_c[4] = {
        LazyVim.lualine.pretty_path({
          length = 0,
          relative = "cwd",
          modified_hl = "MatchParen",
          directory_hl = "",
          filename_hl = "Bold",
          modified_sign = "",
          readonly_icon = " 󰌾 ",
        }),
      }
    end,
  },

  {
    "folke/snacks.nvim",
    keys = {
      {
        ";f",
        function()
          Snacks.picker.files({ hidden = true })
        end,
        desc = "Find Files",
      },
      {
        ";r",
        function()
          Snacks.picker.grep({ hidden = true })
        end,
        desc = "Search Text",
      },
      {
        "\\",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        ";;",
        function()
          Snacks.picker.resume()
        end,
        desc = "Resume Picker",
      },
      {
        ";t",
        function()
          Snacks.picker.help()
        end,
        desc = "Help Tags",
      },
      {
        ";e",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        ";s",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "Document Symbols",
      },
      {
        "sf",
        function()
          Snacks.picker.explorer({ cwd = vim.fn.expand("%:p:h") })
        end,
        desc = "File Explorer Here",
      },
    },
  },
}
