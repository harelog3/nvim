return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		local ts = require("nvim-treesitter")

		local must_parsers = {
			-- core
			"lua",
			"vim",
			"vimdoc",
			"query",

			-- web technologies
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"jsx",
			"angular",
			"vue",
			"svelte",
			"astro",
			"angular",

			-- backend and infra langs
			"go",
			"python",
			"rust",
			"c",
			"c_sharp",

			-- markup and data
			"yaml",
			"markdown",
			"markdown_inline",
			"toml",
			"json",

			-- tooling
			"bash",
			"fish",
			"dockerfile",
			"gitignore",
			"diff",
			"make",
			"http",
			"hurl",
		}

		ts.install(must_parsers)

		-- spawn treesitter
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
