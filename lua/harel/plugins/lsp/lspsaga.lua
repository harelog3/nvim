return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			ui = {
				border = "rounded",
			},
			breadcrumbs = {
				enable = true,
			},
			lightbulb = {
				enable = false,
			},
		})
		local diagnostic = require("lspsaga.diagnostic")
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
		vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
		vim.keymap.set("n", "gd", "<Cmd>Lspsaga finder<CR>", opts)
		vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
		-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
		-- vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
		vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
