local keymap = vim.keymap

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Open netrw
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Clipboard handler
keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)
keymap.set({ "n", "v" }, "<leader>p", '"+p', opts)
keymap.set({ "n", "v" }, "<leader>d", '"+d', opts)

-- write file
keymap.set("n", "<leader>w", vim.cmd.write)

-- window management
keymap.set("n", "<leader>|", ":vsplit<Return>", opts)
keymap.set("n", "<leader>-", ":split<Return>", opts)

keymap.set("n", "<leader>h", "<C-w>h")  -- move to left window (left)
keymap.set("n", "<leader>k", "<C-w>k")  -- move to window above (up)
keymap.set("n", "<leader>j", "<C-w>j")  -- move to window below (down)
keymap.set("n", "<leader>l", "<C-w>l")  -- move to right window (right)

keymap.set("n", "<leader>qw", "<C-w>q") -- remove current window

-- buffer management (possibly in a future i move to tabs)
-- keymap.set("n", "<Tab>", ":bnext<Return>", opts)
-- keymap.set("n", "<S-Tab>", ":bprev<Return>", opts)
keymap.set("n", "<leader>qb", ":bdelete<Return>", opts)

-- indentation
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
