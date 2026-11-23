-- No sidebar. Find files with pickers (<leader>t…); use oil for directory work.
-- oil: the directory is a buffer. Create = write a new line, rename = edit the
-- name, move = cut/paste the line into another oil buffer, delete = dd. Then :w.

require("oil").setup({
	default_file_explorer = true, -- replaces netrw
	columns = { "icon" },
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	watch_for_changes = true,
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name)
			return name == ".." or name == ".git" or name == ".DS_Store"
		end,
	},
	float = { padding = 4, max_width = 90, max_height = 30 },
	keymaps = {
		["q"] = { "actions.close", mode = "n" },
		["<C-h>"] = false, -- keep window navigation free
		["<C-l>"] = false,
		["<C-r>"] = "actions.refresh",
		["<C-s>"] = { "actions.select", opts = { vertical = true } },
		["gp"] = "actions.preview",
		["g."] = { "actions.toggle_hidden", mode = "n" },
		["<leader>ts"] = {
			desc = "Grep in this directory",
			callback = function()
				Snacks.picker.grep({ cwd = require("oil").get_current_dir() })
			end,
		},
		["<leader>th"] = {
			desc = "Find files in this directory",
			callback = function()
				Snacks.picker.files({ cwd = require("oil").get_current_dir() })
			end,
		},
	},
})

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>e", function()
	require("oil").toggle_float()
end, { desc = "Directory (float)" })
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>", { desc = "Open parent directory" })
