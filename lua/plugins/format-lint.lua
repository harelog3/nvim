-- File for conform for formatting and nvim-lint for linter

local web_projects_options = { "biome", "prettierd", "oxfmt", "prettier", stop_after_first = true }

return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters = {
                biome = {
                    require_cwd = true
                }
            },
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
                timeout_ms = 700,
                lsp_format = "fallback",
            },
        },
    },



}
