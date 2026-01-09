-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
--
-- 	config = function()
-- 		local colorscheme = require("catppuccin")
-- 		colorscheme.setup({
-- 			flavour = "mocha",
-- 			transparent_background = true, -- disables setting the background color.
-- 		})
--
-- 		-- call for loading
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- }
--

-- -- lua/plugins/rose-pine.lua
-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }

return {
	"loctvl842/monokai-pro.nvim",
	config = function()
		local colorscheme = require("monokai-pro")
		colorscheme.setup({
			transparent_background = true,
			terminal_colors = true,
			devicons = true, -- highlight the icons of `nvim-web-devicons`
			filter = "octagon",
		})

		vim.cmd("colorscheme monokai-pro")
	end,
}
