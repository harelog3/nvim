local c = _G.MonokaiSun

---------------------------------------------------------------------------
-- Icons: Monokai Pro icon style — simple glyphs, palette colors (not brand colors)
---------------------------------------------------------------------------
require("mini.icons").setup({
	default = {
		directory = { glyph = "" },
		file = { glyph = "󰈔", hl = "MiniIconsGrey" },
	},
	directory = {
		[".git"] = { glyph = "", hl = "MiniIconsGrey" },
		["node_modules"] = { glyph = "", hl = "MiniIconsGrey" },
	},
})
MiniIcons.mock_nvim_web_devicons()

local function icon_hls()
	local map = {
		MiniIconsAzure = c.accent5,
		MiniIconsBlue = c.accent5,
		MiniIconsCyan = c.accent5,
		MiniIconsGreen = c.accent4,
		MiniIconsGrey = c.dimmed2,
		MiniIconsOrange = c.accent2,
		MiniIconsPurple = c.accent6,
		MiniIconsRed = c.accent1,
		MiniIconsYellow = c.accent3,
	}
	for group, fg in pairs(map) do
		vim.api.nvim_set_hl(0, group, { fg = fg })
	end
	-- folders are quiet, like in Monokai Pro icons
	vim.api.nvim_set_hl(0, "Directory", { fg = c.text })
end
icon_hls()
vim.api.nvim_create_autocmd("ColorScheme", { callback = icon_hls })

---------------------------------------------------------------------------
-- Floating filename per window (top right)
---------------------------------------------------------------------------
require("incline").setup({
	window = {
		padding = 0,
		margin = { horizontal = 1, vertical = 1 },
	},
	hide = { cursorline = true },
	render = function(props)
		local path = vim.api.nvim_buf_get_name(props.buf)
		local filename = vim.fn.fnamemodify(path, ":t")
		if filename == "" then
			filename = "[No Name]"
		end
		local icon, icon_hl = MiniIcons.get("file", filename)
		return {
			" ",
			{ icon, group = icon_hl },
			" ",
			{ filename, gui = props.focused and "bold" or nil, guifg = props.focused and c.text or c.dimmed2 },
			vim.bo[props.buf].modified and { " ●", guifg = c.accent2 } or "",
			" ",
		}
	end,
})

---------------------------------------------------------------------------
-- Snacks: picker, notifier, indent, lazygit, dashboard...
---------------------------------------------------------------------------
local Snacks = require("snacks")

Snacks.setup({
	bigfile = { enabled = true },
	image = { enabled = true },
	input = { enabled = true },
	notifier = { enabled = true },
	scroll = { enabled = true },
	words = { enabled = true },
	lazygit = { enabled = true },
	explorer = { enabled = false },

	indent = {
		enabled = true,
		indent = { enabled = false },
		animate = { enabled = false },
		chunk = {
			enabled = true,
			char = {
				horizontal = "─",
				vertical = "│",
				corner_top = "╭",
				corner_bottom = "╰",
				arrow = "─",
			},
		},
	},

	dashboard = {
		enabled = true,
		preset = {
			keys = {
				{ icon = " ", key = "f", desc = "Find file", action = ":lua Snacks.picker.smart()" },
				{ icon = " ", key = "g", desc = "Grep", action = ":lua Snacks.picker.grep()" },
				{ icon = " ", key = "r", desc = "Recent", action = ":lua Snacks.picker.recent()" },
				{ icon = " ", key = "-", desc = "Browse dir", action = ":Oil" },
				{
					icon = " ",
					key = "c",
					desc = "Config",
					action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })",
				},
				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
			},
		},
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1, padding = 1 },
		},
	},

	picker = {
		enabled = true,
		layout = { preset = "telescope" },
		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "i", "n" } },
				},
			},
		},
		sources = {
			grep = { hidden = false, ignored = false },
			files = { hidden = true },
		},
	},
})

-- Pickers (<leader>t…)
local map = function(lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, { desc = desc })
end
local P = function(name, o)
	return function()
		Snacks.picker[name](o)
	end
end

map("<leader>th", P("files"), "Files")
map("<leader>tf", P("smart"), "Smart find (recent + files)")
map("<leader>ts", P("grep"), "Grep")
map("<leader>tw", P("grep_word"), "Grep word / selection")
vim.keymap.set("x", "<leader>tw", P("grep_word"), { desc = "Grep selection" })
map("<leader>tr", P("recent"), "Recent files")
map("<leader>tb", P("buffers"), "Buffers")
map("<leader>td", P("diagnostics"), "Diagnostics")
map("<leader>tD", P("diagnostics_buffer"), "Buffer diagnostics")
map("<leader>tc", P("files", { cwd = vim.fn.stdpath("config") }), "Config files")
map("<leader>tg", P("git_status"), "Git status")
map("<leader>tk", P("keymaps"), "Keymaps")
map("<leader>tH", P("help"), "Help")
map("<leader>tt", P("grep", { search = "TODO|FIXME|HACK|NOTE", regex = true }), "TODOs")
map("<leader>t.", P("resume"), "Resume last picker")
map("<leader>tl", P("lsp_symbols"), "Document symbols")
map("<leader>tL", P("lsp_workspace_symbols"), "Workspace symbols")

map("<leader>n", function()
	Snacks.notifier.show_history()
end, "Notification history")

---------------------------------------------------------------------------
-- Markdown
---------------------------------------------------------------------------
require("render-markdown").setup({
	completions = { blink = { enabled = true } },
})
