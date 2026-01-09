return {
	"nvim-mini/mini.nvim",
	version = "*",
	-- ensure mini.icons replaces nvim-web-devicons
	init = function()
		package.preload["nvim-web-devicons"] = function()
			local icons = require("mini.icons")
			if not _G.MiniIcons then
				icons.setup(icons_opts)
			end
			MiniIcons.mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
	config = function()
		-- -- icons
		-- require("mini.icons").setup()

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

		-- -- file picker
		-- require("mini.pick").setup({
		-- 	mappings = {
		-- 		move_down = "<C-j>",
		-- 		move_start = "<C-g>",
		-- 		move_up = "<C-k>",
		-- 	},
		-- 	opts = {
		-- 		pick = {
		-- 			exclude = {
		-- 				"node_modules",
		-- 				"%.*/node_modules",
		-- 				"build",
		-- 				"dist",
		-- 				".*",
		-- 			},
		-- 		},
		-- 	},
		-- })

		-- vim.keymap.set("n", "<leader>th", function()
		-- 	MiniPick.builtin.files()
		-- end, { noremap = true, silent = true }) -- open file finder
		--
		-- vim.keymap.set("n", "<leader>tc", function()
		-- 	MiniPick.builtin.files({ cwd = vim.fn.stdpath("config") })
		-- end, { noremap = true, silent = true }) -- open file finder for configs
		--
		-- vim.keymap.set("n", "<leader>tb", function()
		-- 	MiniPick.builtin.buffers()
		-- end, { noremap = true, silent = true }) -- open buffer finder
		--
		-- vim.keymap.set("n", "<leader>ts", function()
		-- 	MiniPick.builtin.grep_live()
		-- end, { noremap = true, silent = true }) -- open find by text

		-- highlight all buffer occurences of a word in cursor
		require("mini.cursorword").setup()

		-- better command line
		-- require("mini.cmdline").setup()

		-- notifications
		require("mini.notify").setup()

		-- indentation scopes mark
		require("mini.indentscope").setup()

		-- -- -- statusline
		-- require("mini.statusline").setup()
		--
		-- -- git integrations
		-- require("mini.git").setup()
		-- require("mini.diff").setup()

		-- starter screen
		require("mini.starter").setup()
	end,
}
