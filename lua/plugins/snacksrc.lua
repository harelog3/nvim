local Snacks = require("snacks")

Snacks.setup({
	-- image
	image = {
		enabled = true,
	},

	-- picker
	picker = {
		enabled = true,

		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "i", "n" } },
				},
			},
		},

		sources = {
			grep = {
				hidden = false,
				ignored = true,
			},

			explorer = {
				hidden = true,
				ignored = true,

				layout = {
					layout = {
						position = "right",
						width = 64,
					},
				},

				icons = {
					tree = {
						vertical = "  ",
						middle = "  ",
						last = "  ",
					},

					files = {
						enabled = true,
						dir = "",
						dir_open = "",
					},
				},

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
		enabled = true,
		replace_netrw = true,
	},

	-- indentation
	indent = {
		enabled = true,

		indent = {
			enabled = false,
		},

		chunk = {
			enabled = true,

			char = {
				horizontal = "─",
				vertical = "│",
				corner_top = "╭",
				corner_bottom = "╰",
				arrow = "─",
			},
		},
	},

	scroll = {
		enabled = true,
	},

	dashboard = {
		enabled = true,

		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1, padding = 1 },
		},
	},

	input = {
		enabled = true,
	},

	words = {
		enabled = true,
	},

	notifier = {
		enabled = true,
	},
})

-- Picker
vim.keymap.set("n", "<leader>th", function()
	Snacks.picker.files()
end)

vim.keymap.set("n", "<leader>ts", function()
	Snacks.picker.grep()
end)

vim.keymap.set("n", "<leader>tb", function()
	Snacks.picker.buffers()
end)

vim.keymap.set("n", "<leader>tc", function()
	Snacks.picker.files({
		cwd = vim.fn.stdpath("config"),
	})
end)

vim.keymap.set("n", "<leader>td", function()
	Snacks.picker.diagnostics()
end)

-- Explorer
vim.keymap.set("n", "<leader>e", function()
	Snacks.explorer()
end)
