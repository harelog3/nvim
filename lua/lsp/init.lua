require("lsp.mason")

-- Lua: types for vim.* and plugins, loaded only when needed
require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		{ path = "snacks.nvim", words = { "Snacks" } },
	},
})

-- C#: roslyn.nvim picks the .sln/.csproj and enables the "roslyn" client
require("roslyn").setup({ filewatching = "roslyn" })

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	virtual_text = { spacing = 2, source = "if_many" },
	underline = true,
	severity_sort = true,
	update_in_insert = false,
	float = { source = true },
})

-- Neovim's default gr* maps (grr, gra, grn, gri, grt) make `gr` wait for timeoutlen
for _, lhs in ipairs({ "grr", "gra", "grn", "gri", "grt", "grx" }) do
	pcall(vim.keymap.del, { "n", "x" }, lhs)
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
	callback = function(args)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
		end
		local pick = function(name)
			return function()
				Snacks.picker[name]()
			end
		end

		map("n", "K", vim.lsp.buf.hover, "Hover")
		map("n", "D", vim.diagnostic.open_float, "Line diagnostics")
		map("n", "gd", pick("lsp_definitions"), "Go to definition")
		map("n", "gr", pick("lsp_references"), "References")
		map("n", "gi", pick("lsp_implementations"), "Implementations")
		map("n", "gy", pick("lsp_type_definitions"), "Type definition")
		map("n", "gD", vim.lsp.buf.declaration, "Declaration")
		map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
		map("i", "<C-s>", vim.lsp.buf.signature_help, "Signature help")
	end,
})

-- enable servers whose binary exists (mason puts them on PATH)
local servers = require("lsp.servers")
local enabled = {}
for _, name in ipairs(servers) do
	local cfg = vim.lsp.config[name]
	local cmd = cfg and cfg.cmd
	if type(cmd) == "function" or (type(cmd) == "table" and vim.fn.executable(cmd[1]) == 1) then
		enabled[#enabled + 1] = name
	end
end
vim.lsp.enable(enabled)
