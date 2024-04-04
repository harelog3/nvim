return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				numbers = "none",
				indicator = {
					--icon = '▎', -- this should be omitted if indicator style is not 'icon'
					style = "none",
				},
				modified_icon = "●",
				left_trunc_marker = "",
				right_trunc_marker = "",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, _ in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or " ")
						s = s .. sym
					end
					return s
				end,
				show_buffer_close_icons = false,
			},
		})
	end,
}
