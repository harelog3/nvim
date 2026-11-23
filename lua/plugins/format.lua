-- First available formatter wins for web projects (oxfmt > biome > prettier).
-- oxfmt/biome only run when their config file exists in the project.
local web = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true }

require("conform").setup({
	formatters = {
		biome = { require_cwd = true },
		oxfmt = { require_cwd = true },
		sql_formatter = {
			-- sqlite dialect by default; a project .sql-formatter.json wins
			prepend_args = function(_, ctx)
				if vim.fs.find(".sql-formatter.json", { upward = true, path = ctx.dirname })[1] then
					return {}
				end
				return { "-l", "sqlite" }
			end,
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = web,
		typescript = web,
		javascriptreact = web,
		typescriptreact = web,
		vue = web,
		svelte = web,
		astro = web,
		htmlangular = web,
		css = web,
		scss = web,
		json = web,
		jsonc = web,
		markdown = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
		go = { "goimports", "gofmt" },
		cs = { "csharpier" },
		sql = { "sql_formatter" },
	},
	format_on_save = function(bufnr)
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 1500, lsp_format = "fallback" }
	end,
})

vim.keymap.set({ "n", "x" }, "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format" })

vim.keymap.set("n", "<leader>uf", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	vim.notify("Format on save: " .. (vim.g.disable_autoformat and "off" or "on"))
end, { desc = "Toggle format on save" })
