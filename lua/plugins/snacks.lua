return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- animations
		animate = { enabled = true },

		-- picker
		picker = {
			sources = {
				explorer = {
					win = {
						list = {
							keys = {
								["o"] = "confirm",
								["<Esc>"] = { "close", mode = { "n", "i" } },
							},
						},
					},
				},
			},
			-- close window on a single esc
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "i", "n" } },
						-- ["<C-c>"] = { "close", mode = { "i", "n" } },
					},
				},
			},
		},

		-- notifications
		notify = { enabled = true },

		-- explorer
		explorer = { enabled = true },
	},
	keys = {
		{
			-- file picker
			"<leader>th",
			function()
				Snacks.picker.files()
			end,
		},

		{
			-- config files picker
			"<leader>tc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
		},

		{
			-- buffer picker
			"<leader>tb",
			function()
				Snacks.picker.buffers()
			end,
		},
		{
			-- grep
			"<leader>ts",
			function()
				Snacks.picker.grep()
			end,
		},
		{

			"<leader>e",
			function()
				Snacks.explorer()
			end,
		},
	},
}
