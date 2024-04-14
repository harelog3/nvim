return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		-- colors

		local black = "#45475a"
		local gray = "#585b70"
		local red = "#f38ba8"
		local green = "#a6e3a1"
		local yellow = "#f9e2af"
		local blue = "#89b4fa"
		local magenta = "#f5c2e7"
		local cyan = "#94e2d5"
		local white = "#bac2de"
		local fg = "#cdd6f4"
		local bg = "#1e1e2e"
		local links = "#89dceb"

		bufferline.setup({
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				numbers = "none",
				color_icons = false,
				separator_style = "",
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
				always_show_bufferline = false,
			},
			highlights = {
				-- 	fill = {
				-- 		fg = "#ffffff",
				-- 		bg = "#1e1e2e",
				-- 	},
				background = {
					-- 		bg = "#1e1e2e",
					fg = gray,
				},
				buffer_selected = {
					fg = links,
				},
				buffer_visible = {
					fg = gray,
				},
				-- 	separator_selected = {
				-- 		fg = "#1e1e2e",
				-- 	},
				-- 	separator = {
				-- 		bg = "#1e1e2e",
				-- 		fg = "#1e1e2e",
				-- 	},
				diagnostic = {},
				hint = {
					fg = cyan,
					sp = cyan,
				},
				hint_selected = {
					fg = cyan,
					sp = cyan,
				},
				warning = {
					fg = yellow,
					sp = yellow,
				},

				warning_selected = {
					fg = yellow,
					sp = yellow,
				},
				error = {
					fg = red,
					sp = red,
				},
				error_selected = {
					fg = red,
					sp = red,
				},
				-- 	-- separator_visible = {
				-- 	-- 	bg = "#1e1e2e",
				-- 	-- 	fg = "#1e1e2e",
				-- 	-- },
			},
		})
	end,
}
