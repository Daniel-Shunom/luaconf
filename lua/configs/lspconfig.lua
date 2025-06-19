require("nvchad.configs.lspconfig").defaults()
require('lspconfig').pyright.setup({})

local servers = { "html", "cssls" }
vim.lsp.enable(servers)
vim.lsp.enable('pyright')

-- read :h vim.lsp.config for changing options of lsp servers 
