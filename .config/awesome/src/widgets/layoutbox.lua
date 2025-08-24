local lain = require("lain")
local awful = require("awful")
local theme = require("src.theme")
local markup = lain.util.markup
local function update_txt_layoutbox(s)
	-- Writes a string representation of the current layout in a textbox widget
	local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
	s.mytxtlayoutbox:set_markup(markup.font(theme.font, txt_l))
end
