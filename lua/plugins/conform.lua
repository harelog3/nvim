return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "biome", "prettier", "prettierd", stop_after_first = true },
			c_sharp = { "csharpier" },
		},
		format_on_save = {
			timeout_ms = 300,
			lsp_format = "fallback",
		},
	},
}
