local opt = vim.opt

-- numbers
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true

-- colors
opt.termguicolors = true
opt.background = "light"

-- tabs and spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = false
opt.scrolloff = 6
opt.sidescrolloff = 8

-- search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- splits open where the eye expects them
opt.splitright = true
opt.splitbelow = true

-- persistent undo, no swap noise
opt.undofile = true
opt.swapfile = false

-- faster CursorHold (gitsigns, document highlight)
opt.updatetime = 250
opt.timeoutlen = 400

opt.winborder = "rounded"
opt.pumheight = 12

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

-- cmdline completion
opt.wildmenu = true
opt.wildmode = "full"
opt.wildoptions = "pum,fuzzy"
opt.wildignorecase = true

-- no cmdline row, single global statusline
opt.cmdheight = 0
opt.laststatus = 3
opt.showmode = false

-- reload files changed outside Neovim
opt.autoread = true

-- per-project config (.nvim.lua), asks for trust on first load
opt.exrc = true

opt.fillchars = { eob = " ", diff = "╱" }
opt.list = true
opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
