-- File for conform for formatting and nvim-lint for linter

local web_projects_options = { "prettierd", "biome", "oxfmt", "prettier", stop_after_first = true }

return {
    {
        "stevearc/conform.nvim",
        opts = {

            formatters_by_ft = {
                lua = { "stylua" },
                javascript = web_projects_options,
                typescript = web_projects_options,
                javascriptreact = web_projects_options,
                typescriptreact = web_projects_options,
                vue = web_projects_options,
                svelte = web_projects_options,
                astro = { "prettier" },
                c_sharp = { "csharpier" },
            },

            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        },
    },

}
