return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			direction = "float",
			close_on_exit = true,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		-- keymaps
		vim.keymap.set("n", "<C-t>", ":ToggleTerm<Return>", { noremap = true, silent = true }) -- open terminal on normal mode
		vim.keymap.set("t", "<C-t>", "<C-\\><C-n><C-w>l", { noremap = true, silent = true }) -- hide terminal

		-- always open on insert
		vim.cmd("autocmd BufEnter * if &buftype ==# 'terminal' | startinsert! | endif")
	end,
}
