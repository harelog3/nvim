-- blink.cmp pinned to v1 (stable). It downloads a prebuilt fuzzy-matcher binary
-- for the tagged release, so there is no cargo build on startup.
-- If completion ever stops: :checkhealth blink.cmp, then :BlinkCmp status

require("blink.cmp").setup({
	keymap = {
		preset = "super-tab",
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
	},

	appearance = { nerd_font_variant = "mono" },

	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
		list = { selection = { preselect = true, auto_insert = false } },
		menu = {
			draw = {
				columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
				components = {
					-- reuse mini.icons (Monokai-style colors) for kinds and paths
					kind_icon = {
						text = function(ctx)
							local icon = MiniIcons.get("lsp", ctx.kind)
							return icon .. ctx.icon_gap
						end,
						highlight = function(ctx)
							local _, hl = MiniIcons.get("lsp", ctx.kind)
							return hl
						end,
					},
				},
			},
		},
	},

	signature = { enabled = true },

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			lua = { inherit_defaults = true, "lazydev" },
			sql = { "dadbod", "snippets", "buffer" },
			mysql = { "dadbod", "snippets", "buffer" },
			plsql = { "dadbod", "snippets", "buffer" },
		},
		providers = {
			lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
			dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
		},
	},

	cmdline = { enabled = true },

	fuzzy = { implementation = "prefer_rust_with_warning" },
})
