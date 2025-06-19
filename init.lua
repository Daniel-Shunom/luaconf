vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

vim.diagnostic.config({
  virtual_text = false,      -- Show inline errors
  signs = true,             -- Show signs in the gutter
  underline = true,         -- Underline errors
  severity_sort = true,     -- Sort diagnostics by severity
  update_in_insert = true,  -- <-- THIS is the important part!
})

-- load plugins
require("lazy").setup({
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('lspconfig').gleam.setup({})
    end
  },
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("custom.highlights")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
