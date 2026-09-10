require("incline").setup({
	window = {
		padding = 0,
		margin = {
			horizontal = 1,
			vertical = 1,
		},
	},

	render = function(props)
		local path = vim.api.nvim_buf_get_name(props.buf)
		local filename = vim.fn.fnamemodify(path, ":t")

		if filename == "" then
			filename = "[No Name]"
		end

		local icon, icon_hl = require("mini.icons").get("file", path ~= "" and path or filename)

		local modified = vim.bo[props.buf].modified

		return {
			" ",
			{ icon, group = icon_hl },
			" ",
			{
				filename,
				gui = props.focused and "bold" or nil,
			},
			modified and " ●" or "",
			" ",
		}
	end,
})
