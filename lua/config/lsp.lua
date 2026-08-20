-- lsps to enable
local lsps = {
    -- languages
    "lua_ls",
    "ts_ls",
    "pylsp",
    "svelte",
    "vue_ls",
    "gopls",
    "clangd",
    "html",
    "tailwindcss",
    "emmet_ls",
    "cssls",
    "jsonls",
    "astro",
    "yamlls",
    "zls",
    "prismals",

    -- linters
    "eslint",
    "oxlint",
    "biome",

    -- tools
    "dockerls",
    "docker_compose_language_service",
    "just",

    -- formatters
    "oxfmt"
}

-- diagnostics config
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
    -- virtual_lines = { current_line = true },
    virtual_text = true,
    underline = true,
    severity_sort = true,
    update_in_insert = true,
})

-- global configuration for lsps
vim.lsp.config("*", {
    root_markers = { { "package.json", "tsconfig.json", "jsconfig.json" }, ".git" },
})

-- lua lsp configurations
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        },
    },
})


-- enable lsp
vim.lsp.enable(lsps)
