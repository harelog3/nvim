-- Minimal statusline, no plugins.
--  left:  mode · branch · diff
--  right: diagnostics · filetype · line:col

local M = {}

local modes = {
	n = { "NOR", "Normal" },
	no = { "NOR", "Normal" },
	i = { "INS", "Insert" },
	ic = { "INS", "Insert" },
	v = { "VIS", "Visual" },
	V = { "V-L", "Visual" },
	["\22"] = { "V-B", "Visual" },
	s = { "SEL", "Visual" },
	S = { "SEL", "Visual" },
	R = { "REP", "Replace" },
	c = { "CMD", "Command" },
	t = { "TRM", "Command" },
	nt = { "NOR", "Normal" },
}

-- highlight groups derived from the active colorscheme
local function set_hls()
	local get = function(name, attr)
		local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
		return hl[attr]
	end
	local muted = get("Comment", "fg")
	local accents = {
		Normal = get("Function", "fg"),
		Insert = get("String", "fg"),
		Visual = get("Keyword", "fg"),
		Replace = get("Number", "fg"),
		Command = get("Type", "fg"),
	}
	vim.api.nvim_set_hl(0, "StatusLine", { fg = muted, bg = "NONE" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = muted, bg = "NONE" })
	vim.api.nvim_set_hl(0, "SlMuted", { fg = muted })
	for name, fg in pairs(accents) do
		vim.api.nvim_set_hl(0, "SlMode" .. name, { fg = fg, bold = true })
	end
	vim.api.nvim_set_hl(0, "SlAdd", { link = "Added" })
	vim.api.nvim_set_hl(0, "SlChange", { link = "Changed" })
	vim.api.nvim_set_hl(0, "SlDelete", { link = "Removed" })
end

local function hl(group, text)
	return "%#" .. group .. "#" .. text .. "%*"
end

local function git()
	local d = vim.b.gitsigns_status_dict
	if not d or not d.head or d.head == "" then
		return ""
	end
	local out = hl("SlMuted", " " .. d.head)
	if (d.added or 0) > 0 then
		out = out .. " " .. hl("SlAdd", "+" .. d.added)
	end
	if (d.changed or 0) > 0 then
		out = out .. " " .. hl("SlChange", "~" .. d.changed)
	end
	if (d.removed or 0) > 0 then
		out = out .. " " .. hl("SlDelete", "-" .. d.removed)
	end
	return out
end

local diag_spec = {
	{ vim.diagnostic.severity.ERROR, "DiagnosticError", "" },
	{ vim.diagnostic.severity.WARN, "DiagnosticWarn", "" },
	{ vim.diagnostic.severity.INFO, "DiagnosticInfo", "" },
	{ vim.diagnostic.severity.HINT, "DiagnosticHint", "" },
}

local function diagnostics()
	local counts = vim.diagnostic.count(0)
	local parts = {}
	for _, s in ipairs(diag_spec) do
		local n = counts[s[1]]
		if n and n > 0 then
			parts[#parts + 1] = hl(s[2], s[3] .. " " .. n)
		end
	end
	return table.concat(parts, " ")
end

function M.render()
	local mode = modes[vim.api.nvim_get_mode().mode]
		or modes[vim.api.nvim_get_mode().mode:sub(1, 1)]
		or { "???", "Normal" }
	local ft = vim.bo.filetype
	local right = {
		diagnostics(),
		ft ~= "" and hl("SlMuted", ft) or "",
		hl("SlMuted", "%l:%c"),
	}
	right = vim.tbl_filter(function(s)
		return s ~= ""
	end, right)

	return table.concat({
		" ",
		hl("SlMode" .. mode[2], mode[1]),
		"  ",
		git(),
		"%=",
		table.concat(right, "  "),
		" ",
	})
end

_G.Statusline = M

set_hls()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hls })
vim.api.nvim_create_autocmd({ "DiagnosticChanged", "ModeChanged" }, {
	callback = function()
		vim.cmd.redrawstatus()
	end,
})

vim.o.statusline = "%!v:lua.Statusline.render()"

return M
