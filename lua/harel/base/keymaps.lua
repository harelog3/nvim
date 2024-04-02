local keymap = vim.keymap
local options = { noremap = true, silent = true }


vim.g.mapleader = " "

-- Open file explorer
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Clipboard handler
keymap.set({"n", "v"}, "<leader>y", '"+y', options)
keymap.set({"n", "v"}, "<leader>p", '"+p', options)

-- write file
keymap.set("n", "<leader>w", vim.cmd.write)

-- window management
keymap.set("n", "<leader>|", ":vsplit<Return>", options)
keymap.set("n", "<leader>-", ":split<Return>", options)

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")

-- buffer management (possibly in a future i move to tabs)
keymap.set("n", "<Tab>", ":bnext<Return>", options)
keymap.set("n", "<S-Tab>", ":bprev<Return>", options)
keymap.set("n", "<leader>qb", ":bdelete<Return>", options)


