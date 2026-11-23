-- Per-server overrides on top of nvim-lspconfig defaults (vim.lsp.config).
-- Return value: list of server names to enable.

local mason = vim.fn.stdpath("data") .. "/mason/packages"

---------------------------------------------------------------------------
-- TypeScript / JavaScript (also covers SolidJS: plain TSX + jsxImportSource)
---------------------------------------------------------------------------
vim.lsp.config("vtsls", {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	settings = {
		vtsls = {
			autoUseWorkspaceTsdk = true,
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = mason .. "/vue-language-server/node_modules/@vue/language-server",
						languages = { "vue" },
						configNamespace = "typescript",
					},
				},
			},
		},
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			inlayHints = {
				parameterNames = { enabled = "literals" },
				variableTypes = { enabled = false },
				functionLikeReturnTypes = { enabled = true },
			},
		},
	},
})

---------------------------------------------------------------------------
-- Astro: needs a TypeScript SDK
---------------------------------------------------------------------------
local function get_tsdk(root_dir)
	local candidates = {
		root_dir and (root_dir .. "/node_modules/typescript/lib"),
		mason .. "/vtsls/node_modules/@vtsls/language-server/node_modules/typescript/lib",
	}
	for _, path in ipairs(candidates) do
		if path and vim.uv.fs_stat(path) then
			return path
		end
	end
end

vim.lsp.config("astro", {
	before_init = function(_, config)
		config.init_options = config.init_options or {}
		config.init_options.typescript = config.init_options.typescript or {}
		config.init_options.typescript.tsdk = get_tsdk(config.root_dir)
	end,
})

---------------------------------------------------------------------------
-- Go
---------------------------------------------------------------------------
vim.lsp.config("gopls", {
	settings = {
		gopls = {
			gofumpt = false,
			usePlaceholders = false,
			staticcheck = true,
			analyses = { unusedparams = true, unusedwrite = true, nilness = true },
			hints = {
				parameterNames = true,
				compositeLiteralFields = true,
				constantValues = true,
			},
		},
	},
})

---------------------------------------------------------------------------
-- Prisma (uses the project's prisma CLI)
---------------------------------------------------------------------------
vim.lsp.config("prisma_next", {
	cmd = { "bunx", "prisma", "lsp" },
	filetypes = { "prisma" },
	root_markers = { "prisma.config.ts", "package.json", ".git" },
})

---------------------------------------------------------------------------
-- Linters: only attach when the project actually uses them
---------------------------------------------------------------------------
vim.lsp.config("eslint", {
	root_markers = {
		"eslint.config.js",
		"eslint.config.mjs",
		"eslint.config.cjs",
		"eslint.config.ts",
		".eslintrc",
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.json",
		".eslintrc.yaml",
		".eslintrc.yml",
	},
})
vim.lsp.config("biome", {
	root_markers = { "biome.json", "biome.jsonc" },
	workspace_required = true,
})
vim.lsp.config("oxlint", {
	root_markers = { ".oxlintrc.json" },
	workspace_required = true,
})
vim.lsp.config("oxfmt", {
	root_markers = { ".oxfmtrc.json", ".oxfmtrc.jsonc" },
	workspace_required = true,
})

-- Angular: only inside Angular/Nx workspaces
vim.lsp.config("angularls", {
	root_markers = { "angular.json", "nx.json" },
	workspace_required = true,
})

---------------------------------------------------------------------------
-- HTML / CSS
---------------------------------------------------------------------------
vim.lsp.config("html", {
	filetypes = { "html", "htmlangular", "templ" },
})

vim.lsp.config("tailwindcss", {
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "class:list", "classList", "ngClass", "ui" },
			classFunctions = { "cva", "cn", "clsx", "tw", "defineAppConfig" },
		},
	},
})

return {
	-- languages
	"lua_ls",
	"vtsls",
	"vue_ls",
	"svelte",
	"astro",
	"angularls",
	"gopls",
	"pylsp",
	"clangd",
	"rust_analyzer",
	"zls",
	"prisma_next",

	-- web
	"html",
	"cssls",
	"tailwindcss",
	"emmet_language_server",
	"jsonls",
	"yamlls",

	-- linters
	"eslint",
	"oxlint",
	"biome",

	-- tooling
	"dockerls",
	"docker_compose_language_service",
	"just",
	"bashls",
	"fish_lsp",
	"oxfmt",
	-- C# is handled by roslyn.nvim (see lsp/init.lua)
}
