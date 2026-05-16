return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "json-lsp",
        "lua-language-server",
        "markdown-toc",
        "markdownlint-cli2",
        "marksman",
        "prettier",
        "shfmt",
        "shellcheck",
        "stylua",
        "typescript-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          mason = false,
        },
      },
    },
  },
}
