local parsers = {
	-- core
	"lua",
	"vim",
	"vimdoc",
	"query",
	"regex",
	"luadoc",

	-- web
	"html",
	"css",
	"scss",
	"javascript",
	"typescript",
	"tsx",
	"jsdoc",
	"angular",
	"vue",
	"svelte",
	"astro",
	"graphql",

	-- backend / systems
	"go",
	"gomod",
	"gosum",
	"gowork",
	"c_sharp",
	"python",
	"rust",
	"c",
	"zig",

	-- data / db
	"sql",
	"prisma",
	"json",
	"yaml",
	"toml",
	"xml",

	-- docs / git / tooling
	"markdown",
	"markdown_inline",
	"bash",
	"fish",
	"dockerfile",
	"make",
	"just",
	"http",
	"hurl",
	"gitignore",
	"gitcommit",
	"git_rebase",
	"git_config",
	"diff",
}

require("nvim-treesitter").install(parsers)
require("nvim-ts-autotag").setup()

-- start treesitter highlighting for any filetype with a parser
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("ts_start", { clear = true }),
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})
