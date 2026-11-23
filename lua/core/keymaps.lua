-- Editor-agnostic keymaps (also loaded by vscode_init.lua)
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Clipboard handler
keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)
keymap.set({ "n", "v" }, "<leader>p", '"+p', opts)
keymap.set({ "n", "v" }, "<leader>d", '"+d', opts)

-- write file
keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Write file" })

-- clear search highlight
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- window management
keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { silent = true, desc = "Split vertical" })
keymap.set("n", "<leader>-", "<cmd>split<CR>", { silent = true, desc = "Split horizontal" })

keymap.set("n", "<leader>h", "<C-w>h", { desc = "Window left" })
keymap.set("n", "<leader>j", "<C-w>j", { desc = "Window down" })
keymap.set("n", "<leader>k", "<C-w>k", { desc = "Window up" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Window right" })

keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>", opts)
keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>", opts)
keymap.set("n", "<S-Left>", "<cmd>vertical resize +2<CR>", opts)
keymap.set("n", "<S-Right>", "<cmd>vertical resize -2<CR>", opts)

keymap.set("n", "<leader>qw", "<C-w>q", { desc = "Close window" })

-- indentation keeps selection
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- move selected lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
