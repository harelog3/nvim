local opt = vim.opt

-- numbers
opt.number = true
opt.relativenumber = true

-- colors
opt.termguicolors = true

-- tabs and spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.background = "dark"
opt.signcolumn = "yes"

opt.winborder = "rounded"

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })
