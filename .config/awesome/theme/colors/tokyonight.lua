-- Tokyonight-inspired theme with Arch palete
local palete = {
	fg = "#ffffff", --"#a9b1d6", -- editor foreground
	fg_light = "#c0caf5", -- variables, class names
	bg = "#1a1b26", -- night background
	bg_light = "#24283b", -- storm background
	bg_lighter = "#414868", -- terminal black

	red = "#f7768e", -- keywords, HTML elements
	orange = "#ff9e64", -- number, booleans
	yellow = "#e0af68", -- function params
	green = "#9ece6a", -- strings, class names
	cyan = "#7dcfff", -- markdown/code/import
	blue = "#7aa2f7", -- function names
	purple = "#bb9af7", -- control keywords

	comment = "#565f89", -- comments
	selection = "#414868", -- reused
	line = "#414868", -- reused

	-- extras
	teal = "#73daca",
	aqua = "#2ac3de",
	pink = "#b4f9f8",
	Hsubtext = "#9aa5ce",
}
local theme = {
	fg_normal = palete.fg,
	fg_focus = palete.blue,
	fg_urgent = palete.red,
	fg_minimize = palete.comment,

	-- Backgrounds
	bg_normal = palete.bg_light,
	bg_focus = palete.bg_lighter,
	bg_urgent = palete.bg,
	bg_minimize = palete.selection,
	bg_bar = palete.bg,

	-- Borders
	border_width = 2,
	border_normal = palete.line,
	border_focus = palete.blue .. "AA",
	border_marked = palete.red,

	-- Tasklist
	tasklist_bg_focus = palete.blue .. "AA",
	tasklist_bg_normal = palete.bg_light,
	tasklist_fg_focus = palete.fg_light,
	tasklist_fg_normal = palete.fg,

	-- Taglist
	taglist_fg_focus = palete.fg_light,
	taglist_bg_focus = palete.blue .. "55",
	taglist_fg_normal = palete.fg,
	taglist_bg_normal = "transparent",

	-- Titlebar
	titlebar_bg_focus = palete.bg,
	titlebar_bg_normal = palete.bg_light,
	titlebar_fg_focus = palete.fg_light,
	titlebar_fg_normal = palete.fg,
	titlebar_border_focus = palete.blue,
	titlebar_border_normal = palete.line,

	-- Hotkeys
	hotkeys_modifiers_fg = palete.fg_light,
	colors = palete,
}

return theme
