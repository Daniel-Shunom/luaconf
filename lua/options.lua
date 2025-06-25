require "nvchad.options"

-- add yours here!
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartindent = true        -- Smart autoindenting
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.shiftwidth = 2            -- Indent by 2 spaces
vim.opt.tabstop = 2               -- A tab is 2 spaces
vim.opt.wrap = false              -- Disable line wrapping

vim.opt.cursorline = true         -- Highlight the current line
vim.opt.termguicolors = true      -- Enable 24-bit RGB colors
vim.opt.signcolumn = "yes"        -- Always show the sign column
vim.opt.numberwidth = 4           -- Set number column width
vim.opt.scrolloff = 8             -- Keep 8 lines above/below cursor


vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath("data") .. "/backup//"

vim.opt.writebackup = true

vim.opt.swapfile = true
vim.opt.directory = vim.fn.stdpath("data") .. "/swp//"

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo//"

vim.opt.completeopt = { "menuone", "noselect" }  -- Better completion

vim.opt.timeoutlen = 300        -- Faster key sequence timeout
vim.opt.updatetime = 250        -- Faster diagnostics and CursorHold

vim.opt.whichwrap:append("<,>,[,],h,l")  -- Arrow keys wrap to next/prev line
vim.opt.linebreak = true                -- Wrap lines at word boundaries (if wrap ever enabled)

vim.opt.splitbelow = true       -- Horizontal splits open below
vim.opt.splitright = true       -- Vertical splits open to the right
vim.opt.showmode = false        -- Don’t show mode in command line (if using statusline)

vim.opt.shortmess:append("c")   -- Avoid extra messages during completion
vim.opt.fillchars:append({ eob = " " })  -- Hide ~ on blank lines

vim.opt.lazyredraw = true       -- Improves performance for macros and large files
vim.opt.virtualedit = "block"   -- Allows block selection beyond end of line
vim.opt.showcmd = true          -- Show (partial) command in status line

vim.opt.clipboard = "unnamedplus"  -- Use system clipboard by default

vim.cmd("filetype plugin indent on")  -- Enable filetype-specific plugins and indentation
vim.cmd("syntax on")                  -- Enable syntax highlighting

vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
