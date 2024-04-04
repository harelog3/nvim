return {
	-- mason for downloading lsp
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},

			ensure_installed = {},
		})
		require("mason-tool-installer").setup({

			ensure_installed = {
				"prettier",
				"prettierd",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint_d",
				"clangd",
				"cssls",
				"html",
				"tailwindcss-language-server",
				"lua-language-server",
				"prisma-language-server",
				"pyright",
				"typescript-language-server",
				"emmet-ls",
				"json-lsp",
				"markdownlint",
			},
		})
	end,
}
