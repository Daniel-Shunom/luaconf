require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "bashls" }
vim.lsp.enable(servers)

vim.lsp.enable('pyright')
vim.lsp.enable('gleam')
vim.lsp.enable('erlang_ls')
vim.lsp.enable('cmake')
vim.lsp.enable('tailwind')
vim.lsp.enable('hls')

vim.lsp.config('ts_ls', {
  init_options = { hostInfo = 'neovim' },
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },

  handlers = {
    ['_typescript.rename'] = function(_, result, ctx)
      local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
      vim.lsp.util.show_document({
        uri = result.textDocument.uri,
        range = {
          start = result.position,
          ['end'] = result.position,
        },
      }, client.offset_encoding)
      vim.lsp.buf.rename()
      return vim.NIL
    end,
  },

  on_attach = function(client)
    vim.api.nvim_buf_create_user_command(0, 'LspTypescriptSourceAction', function()
      local source_actions = vim.tbl_filter(function(action)
        return vim.startswith(action, 'source.')
      end, client.server_capabilities.codeActionProvider.codeActionKinds)

      vim.lsp.buf.code_action({
        context = {
          only = source_actions,
        },
      })
    end, {})
  end,
})

vim.lsp.enable('ts_ls')

vim.lsp.config('clangd', {
  cmd = { 
    "clangd",
    "--background-index", 
    "--clang-tidy", 
    "--header-insertion=iwyu", 
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { "compile_commands.json", "compile_flags.txt", ".git", "Makefile" },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
    fallbackFlags = { "-std=c++17" },
  },
  capabilities = require("nvchad.configs.lspconfig").capabilities,
  on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Optional: Add clangd-specific keymaps
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
vim.lsp.enable('clangd')-- read :h vim.lsp.config for changing options of lsp servers
