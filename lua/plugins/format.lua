local web_projects_options = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true }
require("conform").setup({
	formatters = {
		biome = {
			require_cwd = true,
		},
		oxfmt = {
			require_cwd = true,
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = web_projects_options,
		typescript = web_projects_options,
		javascriptreact = web_projects_options,
		typescriptreact = web_projects_options,
		vue = web_projects_options,
		svelte = web_projects_options,
		htmlangular = web_projects_options,
		astro = web_projects_options,
		c_sharp = { "csharpier" },
		go = { "goimports", "gofmt" },
	},

	format_on_save = {
		timeout_ms = 700,
		lsp_format = "fallback",
	},
})
