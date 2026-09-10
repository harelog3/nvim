vim.pack.add({
	-- Treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- Treesitter plugin
	{ src = "https://github.com/windwp/nvim-ts-autotag" }, -- Auto close tags on html-like files

	-- Colorizer
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" },

	-- Utilities
	{ src = "https://github.com/nvim-mini/mini.nvim", version = "stable" }, -- Mini
	{ src = "https://github.com/folke/snacks.nvim" }, -- Snacks

	-- Markdown renderer
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },

	-- Colorscheme
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },

	-- LSP
	{ src = "https://github.com/neovim/nvim-lspconfig" }, -- Basic lsp configurations
	{ src = "https://github.com/mason-org/mason.nvim" }, -- Mason servers

	-- Autocomplete
	{ src = "https://github.com/saghen/blink.lib" }, -- blink lib dep
	{ src = "https://github.com/rafamadriz/friendly-snippets" }, -- snippets
	{ src = "https://github.com/saghen/blink.cmp" }, -- blink auto complete

	-- Formatter
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- Floating status line
	{ src = "https://github.com/b0o/incline.nvim" },
})

-- Setup configs
require("mason").setup()
require("nvim-ts-autotag").setup()
require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.minirc")
require("plugins.snacksrc")
require("plugins.cmp")
require("plugins.format")
require("plugins.inclinerc")
