-- All plugins are managed by the built-in vim.pack (Neovim >= 0.12).
-- Versions are pinned in nvim-pack-lock.json. Update with :lua vim.pack.update()

local gh = function(repo)
	return "https://github.com/" .. repo
end

-- Hooks must exist before vim.pack.add so they run on first install too
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind ~= "delete" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	-- colorscheme
	gh("loctvl842/monokai-pro.nvim"),

	-- core libs / ui
	{ src = gh("nvim-mini/mini.nvim"), version = "stable" },
	gh("folke/snacks.nvim"),
	gh("b0o/incline.nvim"),
	gh("MeanderingProgrammer/render-markdown.nvim"),

	-- treesitter
	gh("nvim-treesitter/nvim-treesitter"),
	gh("windwp/nvim-ts-autotag"),

	-- files
	gh("stevearc/oil.nvim"),

	-- git
	gh("lewis6991/gitsigns.nvim"),

	-- lsp
	gh("neovim/nvim-lspconfig"),
	gh("mason-org/mason.nvim"),
	gh("folke/lazydev.nvim"),
	gh("seblyng/roslyn.nvim"),

	-- completion (stable v1: prebuilt fuzzy binary, no cargo builds)
	gh("rafamadriz/friendly-snippets"),
	{ src = gh("saghen/blink.cmp"), version = vim.version.range("1.*") },

	-- formatting
	gh("stevearc/conform.nvim"),

	-- sql
	gh("tpope/vim-dadbod"),
	gh("kristijanhusak/vim-dadbod-ui"),
	gh("kristijanhusak/vim-dadbod-completion"),
}, { confirm = false })

require("plugins.colorscheme")
require("plugins.ui")
require("plugins.editor")
require("plugins.treesitter")
require("plugins.files")
require("plugins.git")
require("plugins.completion")
require("plugins.format")
require("plugins.sql")
