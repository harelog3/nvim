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

-- Ensures treesitter parsers updated on plugin updates
vim.api.nvim_create_autocmd("User", {
	pattern = "PackChanged",
	callback = function(ev)
		-- Check if nvim-treesitter was one of the packages updated
		if ev.data and ev.data.spec and ev.data.spec.name == "nvim-treesitter" then
			-- Automatically run :TSUpdate
			vim.cmd("TSUpdate")
		end
	end,
})

-- spawn treesitter
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})
