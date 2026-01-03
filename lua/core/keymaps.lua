local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Open netrw
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Clipboard handler
keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)
keymap.set({ "n", "v" }, "<leader>p", '"+p', opts)

-- write file
keymap.set("n", "<leader>w", vim.cmd.write)

-- window management
keymap.set("n", "<leader>|", ":vsplit<Return>", opts)
keymap.set("n", "<leader>-", ":split<Return>", opts)

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")

-- buffer management (possibly in a future i move to tabs)
keymap.set("n", "<Tab>", ":bnext<Return>", opts)
keymap.set("n", "<S-Tab>", ":bprev<Return>", opts)
keymap.set("n", "<leader>qb", ":bdelete<Return>", opts)

-- indentation 
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)



