-- Arch Linux inspired color palette
local colors = {
	arch_blue = "#1793d1",
	arch_grey = "#2f2f2f",
	arch_white = "#F8F8F2",
	bg = "#1e1e1e",
	bg_light = "#2a2a2a",
	bg_lighter = "#353535",
	fg = "#e6e6e6",
	fg_light = "#f5f5f5",
	red = "#ff6b6b",
	green = "#51cc5e",
	yellow = "#ffcc02",
	blue = "#1793d1",
	purple = "#bd93f9",
	cyan = "#8be9fd",
	orange = "#ffb86c",
	comment = "#6c6c6c",
	selection = "#2a2a2a",
	line = "#404040",
}

local theme = {}
-- Foregrounds
theme.fg_normal = colors.fg
theme.fg_focus = colors.blue
theme.fg_urgent = colors.red
theme.fg_minimize = colors.comment

-- Backgrounds
theme.bg_normal = colors.bg_light .. "CC" -- Semi-transparent
theme.bg_focus = colors.bg_lighter .. "CC" -- Semi-transparent
theme.bg_urgent = colors.bg .. "CC"
theme.bg_minimize = colors.selection .. "CC"
theme.bg_bar = colors.bg .. "cc"

-- Borders
theme.border_width = dpi(2)
theme.border_normal = colors.line
theme.border_focus = colors.blue .. "AA"
theme.border_marked = colors.red

-- Tasklist
theme.tasklist_bg_focus = colors.blue .. "AA"
theme.tasklist_bg_normal = colors.bg_light
theme.tasklist_fg_focus = colors.fg_light
theme.tasklist_fg_normal = colors.fg

-- Taglist
theme.taglist_fg_focus = colors.fg_light
theme.taglist_bg_focus = colors.blue .. "55"
theme.taglist_fg_normal = colors.fg
theme.taglist_bg_normal = "transparent"
-- Titlebar
theme.titlebar_bg_focus = colors.bg
theme.titlebar_bg_normal = colors.bg_light
theme.titlebar_fg_focus = colors.fg_light
theme.titlebar_fg_normal = colors.fg
theme.titlebar_border_focus = colors.blue
theme.titlebar_border_normal = colors.line

-- Hotkeys
theme.hotkeys_modifiers_fg = colors.fg_light

return theme
