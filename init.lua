-- Neovim config entry point. Requires Neovim >= 0.12 (uses vim.pack).

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Inside VSCode (vscode-neovim): load only the editor-agnostic bits
if vim.g.vscode then
	require("vscode_init")
	return
end

require("core.options")
require("core.keymaps")
require("core.autocmds")
require("plugins")
require("lsp")
require("core.statusline")
