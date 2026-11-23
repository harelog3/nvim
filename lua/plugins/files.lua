-- No sidebar. Find files with pickers (<leader>t…); use mini.files for directory work.
-- mini.files shows directories as columns of editable text:
--   l / <CR> go in or open · h go up · create = new line (end with / for a dir)
--   rename = edit the name · delete = dd · move = cut, go elsewhere, paste
--   then press = to apply the changes (it asks to confirm), q to close.

local show_hidden = true
local filter = function(entry)
	if show_hidden then
		return entry.name ~= ".git" and entry.name ~= ".DS_Store"
	end
	return not vim.startswith(entry.name, ".")
end

require("mini.files").setup({
	content = { filter = filter },
	mappings = {
		go_in = "l",
		go_in_plus = "<CR>",
		go_out = "h",
		go_out_plus = "-",
		synchronize = "=",
		close = "q",
	},
	options = {
		permanent_delete = false, -- deleted files go to the trash
		use_as_default_explorer = true, -- `nvim .` opens mini.files
	},
	windows = {
		preview = true,
		width_focus = 30,
		width_nofocus = 20,
		width_preview = 50,
	},
})

-- open at the current file (or cwd for unnamed buffers)
local function open_here()
	local path = vim.api.nvim_buf_get_name(0)
	if path == "" or not vim.uv.fs_stat(path) then
		path = vim.uv.cwd()
	end
	MiniFiles.open(path, false)
	MiniFiles.reveal_cwd()
end

vim.keymap.set("n", "-", open_here, { desc = "Files (current dir)" })
vim.keymap.set("n", "<leader>e", open_here, { desc = "Files (current dir)" })
vim.keymap.set("n", "<leader>pv", function()
	MiniFiles.open(vim.uv.cwd(), false)
end, { desc = "Files (project root)" })

-- extra keys inside the explorer
vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("mini_files_keys", { clear = true }),
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf = args.data.buf_id
		local map = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
		end
		local current_dir = function()
			local entry = MiniFiles.get_fs_entry()
			return entry and vim.fs.dirname(entry.path) or vim.uv.cwd()
		end
		local open_split = function(cmd)
			return function()
				local entry = MiniFiles.get_fs_entry()
				if not entry or entry.fs_type ~= "file" then
					return
				end
				local target = MiniFiles.get_explorer_state().target_window
				vim.api.nvim_win_call(target, function()
					vim.cmd(cmd .. " " .. vim.fn.fnameescape(entry.path))
				end)
				MiniFiles.close()
			end
		end

		map("g.", function()
			show_hidden = not show_hidden
			MiniFiles.refresh({ content = { filter = filter } })
		end, "Toggle hidden files")
		map("<C-s>", open_split("vsplit"), "Open in vertical split")
		map("<C-x>", open_split("split"), "Open in horizontal split")
		map("<Esc>", MiniFiles.close, "Close")
		map("<leader>ts", function()
			local dir = current_dir()
			MiniFiles.close()
			Snacks.picker.grep({ cwd = dir })
		end, "Grep in this directory")
		map("<leader>th", function()
			local dir = current_dir()
			MiniFiles.close()
			Snacks.picker.files({ cwd = dir })
		end, "Find files in this directory")
	end,
})
