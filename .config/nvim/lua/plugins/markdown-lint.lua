return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local vault = "/mnt/c/Users/dopamine/Documents/catatandhafin"
      local vault_config = vault .. "/.markdownlint.json"
      local home_config = vim.fn.expand("~/.markdownlint.json")
      local config = vim.uv.fs_stat(vault_config) and vault_config or home_config

      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = { "markdownlint-cli2" }
      opts.linters_by_ft["markdown.mdx"] = { "markdownlint-cli2" }

      opts.linters = opts.linters or {}
      opts.linters["markdownlint-cli2"] = {
        args = {
          "--config",
          config,
          "-",
        },
      }
    end,
  },
}
