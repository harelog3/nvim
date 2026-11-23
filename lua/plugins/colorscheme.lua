-- Everforest (medium). Light or dark follows the macOS appearance, also inside tmux.

require("everforest").setup({
	background = "medium",
	-- let Ghostty paint the background (same color, keeps its opacity/blur)
	transparent_background_level = 1,
	italics = false,
	disable_italic_comments = false,
	ui_contrast = "low",
	float_style = "dim",
	diagnostic_text_highlight = false,
	diagnostic_virtual_text = "coloured",
	on_highlights = function(hl, palette)
		hl.WinSeparator = { fg = palette.bg3 }
	end,
})

-- Ask macOS for the current appearance (works the same inside and outside tmux)
local function system_background(cb)
	if vim.fn.has("mac") == 0 then
		return cb(nil)
	end
	vim.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }, { text = true }, function(res)
		cb((res.stdout or ""):match("Dark") and "dark" or "light")
	end)
end

local function apply(bg)
	if bg and vim.o.background ~= bg then
		vim.o.background = bg
	end
	if vim.g.colors_name ~= "everforest" or bg then
		vim.cmd.colorscheme("everforest")
	end
end

-- startup: wait briefly for the answer so there is no flash of the wrong theme
local done, startup_bg = false, nil
system_background(function(bg)
	startup_bg, done = bg, true
end)
vim.wait(300, function()
	return done
end, 10)
apply(startup_bg)

-- re-check whenever Neovim regains focus (e.g. after macOS switched at sunset)
vim.api.nvim_create_autocmd("FocusGained", {
	group = vim.api.nvim_create_augroup("auto_background", { clear = true }),
	callback = function()
		system_background(vim.schedule_wrap(function(bg)
			if bg and bg ~= vim.o.background then
				apply(bg)
			end
		end))
	end,
})
