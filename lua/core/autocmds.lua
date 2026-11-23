local group = vim.api.nvim_create_augroup("core", { clear = true })
local au = function(event, o)
	o.group = group
	vim.api.nvim_create_autocmd(event, o)
end

-- open help in vertical split
au("FileType", { pattern = "help", command = "wincmd L" })

-- highlight yank
au("TextYankPost", {
	callback = function()
		vim.hl.on_yank({ timeout = 200, higroup = "Visual" })
	end,
})

-- don't continue single line comments on o/O
au("FileType", {
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "o" })
	end,
})

-- syntax highlighting for dotenv files
au({ "BufRead", "BufNewFile" }, {
	pattern = { ".env", ".env.*" },
	callback = function()
		vim.bo.filetype = "dosini"
	end,
})

-- keep splits balanced when the terminal (or tmux pane) is resized
au("VimResized", { command = "tabdo wincmd =" })

-- reopen files at the last cursor position
au("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local lines = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= lines and vim.bo[args.buf].filetype ~= "gitcommit" then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- check for external changes when coming back
au({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })
