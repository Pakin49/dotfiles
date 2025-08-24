local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local theme = require("src.theme")
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local markup = lain.util.markup
local beautiful = require("beautiful")

--local musicplr = awful.util.terminal .. " -title Music -e ncmpcpp"
local mpd_icon = wibox.widget.textbox(markup.font(theme.font, " "))
beautiful.mpd = lain.widget.mpd({
	settings = function()
		if mpd_now.state == "play" then
			artist = mpd_now.artist .. " "
			title = mpd_now.title .. " "
			mpd_icon:set_markup(markup.font(theme.font, "   "))
		elseif mpd_now.state == "pause" then
			mpd_icon:set_markup(markup.font(theme.font, " 󰝛 "))
			artist = " mpd "
			title = "paused "
		else
			artist = ""
			title = ""
			mpd_icon:set_markup(markup.font(theme.font, "  ")) --󰝛
		end
		widget:set_markup(markup.font(theme.font, markup(theme.colors.purple, artist) .. title))
	end,
})
local mpd_widget = wibox.widget({
	mpd_icon,
	theme.mpd,
	layout = wibox.layout.fixed.horizontal,
})
mpd_widget:buttons(my_table.join(
	--awful.button({ "Mod4" }, 1, function () awful.spawn(musicplr) end),
	awful.button({}, 1, function()
		os.execute("mpc prev")
		theme.mpd.update()
	end),
	awful.button({}, 2, function()
		os.execute("mpc toggle")
		theme.mpd.update()
	end),
	awful.button({}, 3, function()
		os.execute("mpc next")
		theme.mpd.update()
	end)
))

return mpd_widget
