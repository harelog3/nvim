-- Inside VSCode (vscode-neovim): load only the editor-agnostic bits
if vim.g.vscode then
	require("vscode_init")
	return
end

require("options")
require("keymaps")
require("autocmds")
require("plugins.config")
require("lsp")
