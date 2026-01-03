return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		local colorscheme = require("catppuccin")
		colorscheme.setup({
			flavour = "mocha",
			transparent_background = true, -- disables setting the background color.
		})

		-- call for loading
		vim.cmd.colorscheme("catppuccin")
	end,
}
