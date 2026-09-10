local cmp = require("blink.cmp")

cmp.build():pwait()

cmp.setup({
	keymap = {
		preset = "super-tab",

		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = true,
		},

		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},
	},

	-- Usa vim.snippet + friendly-snippets
	snippets = {
		preset = "default",
	},

	sources = {
		default = {
			"lsp",
			"path",
			"snippets",
			"buffer",
		},
	},

	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})
