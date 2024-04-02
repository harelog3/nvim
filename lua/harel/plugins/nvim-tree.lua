return {
	"nvim-tree/nvim-tree.lua",

	config = function()
		local tree = require("nvim-tree")
		local api = require("nvim-tree.api")
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		tree.setup({
			diagnostics = {
				enable = true,
			},
		})

		-- mappings
		local keymap = vim.keymap
		local options = { noremap = true, silent = true }

		-- open file on creation
		api.events.subscribe(api.events.Event.FileCreated, function(file)
			vim.cmd("edit " .. file.fname)
		end)

		keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", options)
	end,
}
