return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			telescope.setup({
				defaults = {
					path_display = { "truncate " },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
			})

			telescope.load_extension("file_browser")

			-- keymaps
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>th", builtin.find_files, {})
			vim.keymap.set("n", "<leader>ts", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>tg", builtin.git_files, {})
			vim.keymap.set("n", "<space>tu", ":Telescope file_browser<CR>")
			-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
}
