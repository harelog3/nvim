-- lsps to enable
local lsps = {
	-- languages
	"lua_ls",
	"vtsls",
	"vue_ls",
	"pylsp",
	"svelte",
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
	-- "prismals",
	"roslyn_ls",
	"angularls",
	"prisma_next",

	-- linters
	"eslint",
	"oxlint",
	"biome",

	-- tools
	"dockerls",
	"docker_compose_language_service",
	"just",

	-- formatters
	"oxfmt",
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
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

-- setup prisma config
vim.lsp.config("prisma_next", {
	cmd = { "bunx", "prisma", "lsp" },
	filetypes = { "prisma" },
	root_markers = {
		"prisma.config.ts",
		"package.json",
		".git",
	},
})

-- Typescript lsp configs
local vue_language_server_path = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}

vim.lsp.config("vtsls", {
	filetypes = {
		"typescript",
		"javascript",
		"javascriptreact",
		"typescriptreact",
		"vue",
	},

	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
})

-- astro config
vim.lsp.config("astro", {
	before_init = function(_, config)
		-- ...
		local npm_root = vim.fn.systemlist("npm root -g")
		-- ...
	end,
})

-- roslyn C#
vim.lsp.config("roslyn_ls", {
	-- allow for single cs files to activate roslyn lsp
	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(bufnr, function(name)
			return name:match("%.sln[x]?$") ~= nil
		end)

		if not root then
			root = vim.fs.root(bufnr, function(name)
				return name:match("%.csproj$") ~= nil
			end)
		end

		if not root then
			local file = vim.api.nvim_buf_get_name(bufnr)
			root = vim.fs.dirname(file)
		end

		on_dir(root)
	end,
})

-- eslint configuration
vim.lsp.config("eslint", {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	root_markers = {
		"eslint.config.js",
		"eslint.config.mjs",
		"eslint.config.cjs",
		".eslintrc",
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.json",
		".eslintrc.yaml",
		".eslintrc.yml",
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

-- html config
vim.lsp.config("html", {
	filetypes = { "html", "htmlangular", "templ" },
})

-- tailwindcss config
vim.lsp.config("tailwindcss", {
	settings = {
		tailwindCSS = {
			classAttributes = {
				"class",
				"className",
				"class:list",
				"classList",
				"ngClass",
				"ui",
			},

			classFunctions = {
				"defineAppConfig",
			},
		},
	},
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
		map("n", "<leader>ca", vim.lsp.buf.code_action)
		map("n", "<leader>rn", vim.lsp.buf.rename)
	end,
})

-- enable lsp
vim.lsp.enable(lsps)
