-- SQL with vim-dadbod (+ UI + completion). Works with sqlite, postgres, mysql...
--
-- Connections: per project in .nvim.lua (loaded thanks to 'exrc'):
--     vim.g.dbs = {
--       { name = "dev", url = "sqlite:" .. vim.fn.getcwd() .. "/dev.db" },
--     }
-- or add them from the UI with <leader>D then "A".
--
-- In a query buffer: write SQL and run it with <leader>S (whole file or selection).

vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_win_position = "right"
vim.g.db_ui_winwidth = 40
vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_execute_on_save = 0
vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"

vim.keymap.set("n", "<leader>D", "<cmd>DBUIToggle<CR>", { desc = "Database UI" })

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("sql_buffers", { clear = true }),
	pattern = { "sql", "mysql", "plsql" },
	callback = function(args)
		vim.keymap.set(
			{ "n", "x" },
			"<leader>S",
			"<Plug>(DBUI_ExecuteQuery)",
			{ buffer = args.buf, desc = "Run query" }
		)
		vim.bo[args.buf].shiftwidth = 2
	end,
})
