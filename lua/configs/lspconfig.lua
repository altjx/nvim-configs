require("nvchad.configs.lspconfig").defaults()

-- Configure language servers using vim.lsp.config
vim.lsp.config.ruby_lsp = {
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  root_markers = { "Gemfile", ".git" },
}

local servers = { "html", "cssls", "ruby_lsp" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
