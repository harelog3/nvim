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

-- opt.background = "light"
opt.signcolumn = "yes"

opt.winborder = "rounded"

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

-- Autocompletion and suggestions for cmdline
opt.wildmenu = true
opt.wildmode = "full"
opt.wildoptions = "pum,fuzzy"
opt.wildignorecase = true

-- cmdline height
opt.cmdheight = 0

-- View changes live even when source is outside Neovim
opt.autoread = true

opt.laststatus = 3

-- undercurl
vim.api.nvim_set_hl(0, "DiagnosticError", { undercurl = true })

-- folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldcolumn = "1"
