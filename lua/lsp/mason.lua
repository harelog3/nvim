-- Mason installs LSPs, formatters and linters into stdpath("data")/mason.
-- Anything listed here is installed automatically on a new machine (:Mason to inspect).

local ensure_installed = {
	-- lsp
	"lua-language-server",
	"vtsls",
	"vue-language-server",
	"svelte-language-server",
	"astro-language-server",
	"angular-language-server",
	"tailwindcss-language-server",
	"html-lsp",
	"css-lsp",
	"json-lsp",
	"yaml-language-server",
	"emmet-language-server",
	"gopls",
	"roslyn-language-server",
	"python-lsp-server",
	"clangd",
	"bash-language-server",
	"fish-lsp",
	"dockerfile-language-server",
	"docker-compose-language-service",
	"just-lsp",

	-- linters (as LSPs)
	"eslint-lsp",
	"oxlint",
	"biome",

	-- formatters
	"oxfmt",
	"prettierd",
	"prettier",
	"stylua",
	"goimports",
	"csharpier",
	"sql-formatter",
}

require("mason").setup({
	ui = { border = "rounded" },
})

local registry = require("mason-registry")
registry.refresh(function()
	for _, name in ipairs(ensure_installed) do
		local ok, pkg = pcall(registry.get_package, name)
		if ok and not pkg:is_installed() and not pkg:is_installing() then
			vim.notify("mason: installing " .. name)
			pkg:install()
		elseif not ok then
			vim.notify("mason: unknown package " .. name, vim.log.levels.WARN)
		end
	end
end)
