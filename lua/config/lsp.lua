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
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    root_markers = { { "package.json", "tsconfig.json", "jsconfig.json" }, ".git" },
})

-- enable lsps
vim.lsp.enable({
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

    -- linters
    "eslint",
    "oxlint",
    "biome",

    -- tools
    "dockerls",
})

-- ============ CONFIGURATIONS =================

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

-- setup for vue files
local vue_language_server_path = vim.fn.stdpath("data")
    .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
    name = "@vue/typescript-plugin",
    location = vue_language_server_path,
    languages = { "vue" },
    configNamespace = "typescript",
}

vim.lsp.config("ts_ls", {
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    init_options = {
        plugins = { vue_plugin },
    },
})

-- eslint configuration
vim.lsp.config("eslint", {
    cmd = { "vscode-eslint-language-server", "--stdio" },
    root_markers = {
        "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs",
        ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml",
    },
})

-- biome configuration
vim.lsp.config("biome", {
    cmd = { "biome", "lsp-proxy" },
    root_markers = { "biome.json", "biome.jsonc" },
})

-- oxlint config
vim.lsp.config("oxlint", {
    cmd = { "oxlint", "--lsp" },
    root_markers = { ".oxlintrc.json" },
})


-- when the lsp is attached to buffer
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local map = function(mode, key, rhs)
            vim.keymap.set(mode, key, rhs, { buffer = bufnr })
        end

        map("n", "K", vim.lsp.buf.hover)
        map("n", "D", vim.diagnostic.open_float)
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>ca", vim.lsp.buf.code_action)
    end
})
