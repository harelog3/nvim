return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = {
					enable = true,
				},
				-- ensure these language parsers are installed
				ensure_installed = {
					"c",
					"lua",
					"javascript",
					"typescript",
					"html",
					"css",
					"prisma",
					"python",
					"gitignore",
					"dockerfile",
					"yaml",
					"tsx",
					"bash",
					"markdown",
					"markdown_inline",
					"json",
					"go",
				},
			})

			-- read handlebars as html
			vim.cmd("autocmd BufRead,BufNewFile *.handlebars set filetype=html")
		end,
	},
}
