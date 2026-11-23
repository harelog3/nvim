-- Config used when Neovim runs inside VSCode (vscode-neovim extension).
-- Reuses the plain-vim parts of this config and maps the rest to VSCode commands.

local vscode = require("vscode")

-- leader is set in init.lua

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- shared, editor-agnostic config (clipboard maps, <leader>w, visual indent, yank highlight)
require("core.keymaps")
require("core.autocmds")

-- surround, same mappings as in plugins/minirc.lua
pcall(vim.cmd.packadd, "mini.nvim")
local ok, surround = pcall(require, "mini.surround")
if ok then
	surround.setup({
		mappings = {
			add = "gsa",
			delete = "gsd",
			find = "gsf",
			find_left = "gsF",
			highlight = "gsh",
			replace = "gsr",

			suffix_last = "l",
			suffix_next = "n",
		},
	})
end

local function action(cmd)
	return function()
		vscode.action(cmd)
	end
end

local function map(mode, lhs, cmd)
	vim.keymap.set(mode, lhs, action(cmd), { silent = true })
end

-- window / pane navigation (also reaches the explorer on the right and the panel below)
map("n", "<leader>h", "workbench.action.navigateLeft")
map("n", "<leader>j", "workbench.action.navigateDown")
map("n", "<leader>k", "workbench.action.navigateUp")
map("n", "<leader>l", "workbench.action.navigateRight")

-- splits
map("n", "<leader>|", "workbench.action.splitEditor")
map("n", "<leader>-", "workbench.action.splitEditorDown")
-- like <C-w>q: close only this pane; its files stay in the quick open history (<leader>tb)
map("n", "<leader>qw", "workbench.action.closeGroup")
map("n", "<leader>qb", "workbench.action.closeActiveEditor")

-- resize
map("n", "<S-Up>", "workbench.action.increaseViewHeight")
map("n", "<S-Down>", "workbench.action.decreaseViewHeight")
map("n", "<S-Left>", "workbench.action.increaseViewWidth")
map("n", "<S-Right>", "workbench.action.decreaseViewWidth")

-- pickers
map("n", "<leader>th", "workbench.action.quickOpen")
map("n", "<leader>ts", "workbench.action.quickTextSearch")
-- "buffers": recent files from every pane; picking one opens it in the current pane
map("n", "<leader>tb", "workbench.action.quickOpen")
map("n", "<leader>td", "workbench.actions.view.problems")
map("n", "<leader>tc", "workbench.action.openSettingsJson")

-- explorer (opens, focuses and reveals the current file)
map("n", "<leader>e", "workbench.files.action.showActiveFileInExplorer")
map("n", "<leader>pv", "workbench.files.action.showActiveFileInExplorer")

-- lsp
map("n", "K", "editor.action.showHover")
map("n", "D", "editor.action.showHover")
map("n", "gd", "editor.action.revealDefinition")
map("n", "gr", "editor.action.goToReferences")
map("n", "<leader>ca", "editor.action.quickFix")
map("n", "<leader>rn", "editor.action.rename")
