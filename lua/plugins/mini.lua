return {
	"nvim-mini/mini.nvim",
	version = "*",

	config = function()
		--
		-- autopairs
		require("mini.pairs").setup()

		-- tabline
		-- require("mini.tabline").setup()

		-- surround
		require("mini.surround").setup({
			mappings = {
				add = "<leader>sa",
				delete = "<leader>sd",
				replace = "<leader>sr",
				find = "<leader>sf",
				find_left = "<leader>sF",
				highlight = "<leader>sh",
				update_n_lines = "<leader>sn",
			},
		})

		-- highlight patterns
		require("mini.hipatterns").setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		})

		-- highlight all buffer occurences of a word in cursor
		require("mini.cursorword").setup()

		-- better command line
		-- require("mini.cmdline").setup()

		-- notifications
		-- require("mini.notify").setup()

		-- indentation scopes mark
		require("mini.indentscope").setup()

		-- -- statusline
		-- require("mini.statusline").setup()

		-- git integrations
		-- require("mini.git").setup()
		-- require("mini.diff").setup()
	end,
}
