return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- picker
		picker = {
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "i", "n" } },
					},
				},
			},
			-- explorer config
			sources = {
				explorer = {
					layout = { layout = { position = "right" } },
					win = {
						list = {
							keys = {
								["o"] = "confirm",
							},
						},
					},
				},
			},
		},

		-- explorer
		explorer = {
			replace_netrw = true,
		},

		-- terminal
		terminal = {
			enable = true,
		},
	},
	keys = {

		-- Picker
		{
			"<leader>th",
			function()
				Snacks.picker.files()
			end,
		},
		{
			"<leader>ts",
			function()
				Snacks.picker.grep()
			end,
		},

		{
			"<leader>tb",
			function()
				Snacks.picker.buffers()
			end,
		},

		{
			"<leader>tc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
		},

		-- explorer
		{

			"<leader>e",
			function()
				Snacks.explorer()
			end,
		},
	},
}
