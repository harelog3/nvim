require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	current_line_blame = false,
	current_line_blame_opts = { delay = 300, virt_text_pos = "eol" },
	current_line_blame_formatter = "<author>, <author_time:%R> · <summary>",
	on_attach = function(bufnr)
		local gs = require("gitsigns")
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
		end

		map("n", "]h", function()
			gs.nav_hunk("next")
		end, "Next hunk")
		map("n", "[h", function()
			gs.nav_hunk("prev")
		end, "Prev hunk")

		map("n", "<leader>gs", gs.stage_hunk, "Stage/unstage hunk")
		map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
		map("v", "<leader>gs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, "Stage selection")
		map("v", "<leader>gr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, "Reset selection")
		map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
		map("n", "<leader>gp", gs.preview_hunk_inline, "Preview hunk")

		map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end, "Blame line")
		map("n", "<leader>gB", gs.blame, "Blame buffer")
		map("n", "<leader>gt", gs.toggle_current_line_blame, "Toggle inline blame")
		map("n", "<leader>gd", gs.diffthis, "Diff against index")

		map({ "o", "x" }, "ih", gs.select_hunk, "Inner hunk")
	end,
})

-- redraw the statusline when gitsigns refreshes branch/diff counts
vim.api.nvim_create_autocmd("User", {
	pattern = "GitSignsUpdate",
	callback = function()
		vim.cmd.redrawstatus()
	end,
})

local map = function(lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, { desc = desc })
end
map("<leader>gg", function()
	Snacks.lazygit()
end, "Lazygit")
map("<leader>gl", function()
	Snacks.picker.git_log_file()
end, "File history")
map("<leader>gL", function()
	Snacks.picker.git_log()
end, "Repo log")
map("<leader>go", function()
	Snacks.gitbrowse()
end, "Open in browser")
vim.keymap.set("x", "<leader>go", function()
	Snacks.gitbrowse()
end, { desc = "Open selection in browser" })
