-- Monokai Pro Light (Filter Sun) — same theme as VS Code.
-- monokai-pro.nvim ships the plain "light" filter; we swap in the Filter Sun palette.

local sun = {
	dark2 = "#d3cbc4",
	dark1 = "#ede5de",
	background = "#f8efe7",
	text = "#2c232e",
	accent1 = "#ce4770", -- red
	accent2 = "#d4572b", -- orange
	accent3 = "#b16803", -- yellow
	accent4 = "#218871", -- green
	accent5 = "#2473b6", -- blue
	accent6 = "#6851a2", -- purple
	dimmed1 = "#72696d",
	dimmed2 = "#92898a",
	dimmed3 = "#a59c9c",
	dimmed4 = "#beb5b3",
	dimmed5 = "#d3cbc4",
}

-- shared with icons / statusline / incline
_G.MonokaiSun = sun

require("monokai-pro").setup({
	filter = "light",
	transparent_background = true,
	terminal_colors = true,
	-- clean look: only comments italic
	styles = {
		comment = { italic = true },
		keyword = {},
		type = {},
		storageclass = {},
		structure = {},
		parameter = {},
		annotation = {},
		tag_attribute = {},
	},
	inc_search = "background",
	override_palette = function(filter)
		if filter == "light" then
			return sun
		end
	end,
	override = function()
		return {
			-- thin, quiet floats and separators
			NormalFloat = { bg = "NONE" },
			FloatBorder = { fg = sun.dimmed4, bg = "NONE" },
			WinSeparator = { fg = sun.dimmed5 },
			CursorLine = { bg = sun.dark1 },
			CursorLineNr = { fg = sun.text, bold = true },
			LineNr = { fg = sun.dimmed4 },
			DiagnosticUnderlineError = { undercurl = true, sp = sun.accent1 },
			DiagnosticUnderlineWarn = { undercurl = true, sp = sun.accent3 },
		}
	end,
})

vim.cmd.colorscheme("monokai-pro-light")
