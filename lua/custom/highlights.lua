-- Custom diagnostic highlighting for errors, warnings, info, hints
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError",   { fg = "#ff5555", bg = "#2d2d2d" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",    { fg = "#f1fa8c", bg = "#2d2d2d" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo",    { fg = "#8be9fd", bg = "#2d2d2d" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint",    { fg = "#50fa7b", bg = "#2d2d2d" })

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError",     { undercurl = true, sp = "#ff5555" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",      { undercurl = true, sp = "#f1fa8c" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",      { undercurl = true, sp = "#8be9fd" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",      { undercurl = true, sp = "#50fa7b" })
