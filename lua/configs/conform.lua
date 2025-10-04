local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    ruby = { "rubocop" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  formatters = {
    rubocop = {
      command = "bundle",
      args = { "exec", "rubocop", "-c", ".rubocop.yml", "--autocorrect-all", "--stdin", "$FILENAME", "--stderr" },
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
