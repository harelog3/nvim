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
				color_icons = false,
				separator_style = "slant",
				indicator = {
					--icon = '▎', -- this should be omitted if indicator style is not 'icon'
					style = "none",
				},
				modified_icon = "●",
				left_trunc_marker = "",
				right_trunc_marker = "",

				diagnostic = "nvim_lsp",
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
			-- highlights = {
			-- 	fill = {
			-- 		fg = "#ffffff",
			-- 		bg = "#1e1e2e",
			-- 	},
			-- 	background = {
			-- 		bg = "#1e1e2e",
			-- 		fg = "#585b70",
			-- 	},
			-- 	separator_selected = {
			-- 		fg = "#1e1e2e",
			-- 	},
			-- 	separator = {
			-- 		bg = "#1e1e2e",
			-- 		fg = "#1e1e2e",
			-- 	},
			-- 	diagnostic = {
			-- 		bg = "#1e1e2e",
			-- 	},
			-- 	-- separator_visible = {
			-- 	-- 	bg = "#1e1e2e",
			-- 	-- 	fg = "#1e1e2e",
			-- 	-- },
			-- },
		})
	end,
}
