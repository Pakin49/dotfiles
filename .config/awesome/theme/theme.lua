local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme = {}
theme.default_dir = require("awful.util").get_themes_dir() .. "default"
theme.dir = os.getenv("HOME") .. "/.config/awesome/theme"
theme.wallpaper = theme.dir .. "/wall.png"
theme.font = "Hack Nerd Font 11"
theme.desktop_font = "Hack Nerd Font Bold 13"

-- OneDark Darker color palette
local colors = {
	bg = "#242424",
	bg_light = "#303030",
	bg_lighter = "#3a3a3a",
	fg = "#e6e6e6",
	fg_light = "#f5f5f5",
	red = "#e06c75",
	green = "#98c379",
	yellow = "#e5c07b",
	blue = "#61afef",
	purple = "#c678dd",
	cyan = "#56b6c2",
	orange = "#d19a66",
	comment = "#5c6370",
	selection = "#303030",
	line = "#252525",
}

-- Foregrounds
theme.fg_normal = colors.fg
theme.fg_focus = colors.blue
theme.fg_urgent = colors.red
theme.fg_minimize = colors.comment

-- Backgrounds
theme.bg_normal = colors.bg .. "DD" -- Semi-transparent
theme.bg_focus = colors.bg_light .. "DD" -- Semi-transparent
theme.bg_urgent = colors.bg .. "DD"
theme.bg_minimize = colors.selection .. "CC"

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

-- Opaque versions for titlebars
local opaque_bg_normal = colors.bg
local opaque_bg_focus = colors.bg_light

-- Titlebar
theme.titlebar_bg_focus = opaque_bg_focus
theme.titlebar_bg_normal = opaque_bg_normal
theme.titlebar_fg_focus = colors.fg_light
theme.titlebar_fg_normal = colors.fg
theme.titlebar_border_focus = colors.blue
theme.titlebar_border_normal = colors.line

-- Hotkeys
theme.hotkeys_modifiers_fg = colors.fg_light

-- Systray
theme.systray_icon_spacing = 10
theme.bg_systray = theme.bg_normal

theme.wibox_height = dpi(30)

theme.menu_height = dpi(16)
theme.menu_width = dpi(140)
theme.ocol = "<span color='" .. theme.fg_normal .. "'>"
theme.tasklist_sticky = theme.ocol .. "[S]</span>"
theme.tasklist_ontop = theme.ocol .. "[T]</span>"
theme.tasklist_floating = theme.ocol .. "[F]</span>"
theme.tasklist_maximized_horizontal = theme.ocol .. "[M] </span>"
theme.tasklist_maximized_vertical = ""
theme.tasklist_disable_icon = true
theme.awesome_icon = theme.dir .. "/icons/awesome.png"
theme.menu_submenu_icon = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel = theme.dir .. "/icons/square_unsel.png"
theme.useless_gap = 5
theme.layout_tile = theme.dir .. "/icons/tile.png"
theme.layout_tileleft = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv = theme.dir .. "/icons/fairv.png"
theme.layout_fairh = theme.dir .. "/icons/fairh.png"
theme.layout_spiral = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle = theme.dir .. "/icons/dwindle.png"
theme.layout_max = theme.dir .. "/icons/max.png"
theme.layout_fullscreen = theme.dir .. "/icons/fullscreen.png" -- this picture is missing
theme.layout_magnifier = theme.dir .. "/icons/magnifier.png"
theme.layout_floating = theme.dir .. "/icons/floating.png"
theme.titlebar_close_button_normal = theme.default_dir .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus = theme.default_dir .. "/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal = theme.default_dir .. "/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = theme.default_dir .. "/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive = theme.default_dir .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = theme.default_dir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.default_dir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = theme.default_dir .. "/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive = theme.default_dir .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = theme.default_dir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.default_dir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = theme.default_dir .. "/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive = theme.default_dir .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = theme.default_dir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.default_dir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = theme.default_dir .. "/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.default_dir .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = theme.default_dir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.default_dir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = theme.default_dir .. "/titlebar/maximized_focus_active.png"

-- themes for wigets yanked from power-arrow dark
theme.widget_ac = theme.dir .. "/icons/ac.png"
theme.widget_battery = theme.dir .. "/icons/battery.png"
theme.widget_battery_low = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty = theme.dir .. "/icons/battery_empty.png"
theme.widget_net = theme.dir .. "/icons/net.png"
theme.widget_temp = theme.dir .. "/icons/temp.png"
-- lain related
theme.layout_txt_cascade = "[cascade]"
theme.layout_txt_cascadetile = "[cascadetile]"
theme.layout_txt_centerwork = "[centerwork]"
theme.layout_txt_termfair = "[termfair]"
theme.layout_txt_centerfair = "[centerfair]"

local markup = lain.util.markup
local white = theme.fg_focus
local gray = theme.fg_normal

-- Textclock
local clock = awful.widget.watch("date +'%d/%m/%Y %H:%M'", 60, function(widget, stdout)
	widget:set_markup(" " .. markup.font(theme.desktop_font, stdout))
end)

-- Calendar
theme.cal = lain.widget.cal({
	attach_to = { clock },
	notification_preset = {
		fg = "#FFFFFF",
		bg = theme.bg_normal,
		position = "top_middle",
		font = theme.font,
	},
})

-- MPD
theme.mpd = lain.widget.mpd({
	settings = function()
		mpd_notification_preset.fg = white

		artist = mpd_now.artist .. " "
		title = mpd_now.title .. " "

		if mpd_now.state == "pause" then
			artist = "mpd "
			title = "paused "
		elseif mpd_now.state == "stop" then
			artist = ""
			title = ""
		end

		widget:set_markup(markup.font(theme.font, markup(gray, artist) .. markup(white, title)))
	end,
})

-- /home fs
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = white, bg = theme.bg_normal, font = "Terminus 10.5" },
    settings  = function()
        local fs_header, fs_p = "", ""

        if fs_now["/home"].percentage >= 90 then
            fs_header = " Hdd "
            fs_p      = fs_now["/home"].percentage
        end

        widget:set_markup(markup.font(theme.font, markup(gray, fs_header) .. markup(white, fs_p)))
    end
})
--]]

-- ALSA volume bar
theme.volume = lain.widget.alsabar({
	ticks = true,
	width = dpi(67),
	notification_preset = { font = theme.font },
})
theme.volume.tooltip.wibox.fg = theme.fg_focus
theme.volume.tooltip.wibox.font = theme.font
theme.volume.bar:buttons(my_table.join(
	awful.button({}, 1, function()
		awful.spawn(string.format("%s -e alsamixer", terminal))
	end),
	awful.button({}, 2, function()
		os.execute(string.format("%s set %s 100%%", theme.volume.cmd, theme.volume.channel))
		theme.volume.update()
	end),
	awful.button({}, 3, function()
		os.execute(
			string.format("%s set %s toggle", theme.volume.cmd, theme.volume.togglechannel or theme.volume.channel)
		)
		theme.volume.update()
	end),
	awful.button({}, 4, function()
		os.execute(string.format("%s set %s 1%%+", theme.volume.cmd, theme.volume.channel))
		theme.volume.update()
	end),
	awful.button({}, 5, function()
		os.execute(string.format("%s set %s 1%%-", theme.volume.cmd, theme.volume.channel))
		theme.volume.update()
	end)
))
local volumebg = wibox.container.background(theme.volume.bar, "#585858", gears.shape.rectangle)
local volumewidget = wibox.container.margin(volumebg, dpi(7), dpi(7), dpi(5), dpi(5))

-- Weather
--[[ to be set before use
theme.weather = lain.widget.weather({
    --APPID =
    city_id = 2643743, -- placeholder (London)
    notification_preset = { font = theme.font, fg = white }
})
--]]

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
	settings = function()
		widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
	end,
})

-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
	settings = function()
		widget:set_markup(
			markup.font(
				theme.font,
				markup("#7AC82E", " " .. string.format("%06.1f", net_now.received))
					.. " "
					.. markup("#46A8C3", " " .. string.format("%06.1f", net_now.sent) .. " ")
			)
		)
	end,
})

-- Separators
local first = wibox.widget.textbox(markup.font("Hack Nerd Font 17", markup.fg.color("#61afef", "  |")))
local spr = wibox.widget.textbox("  ")

local function update_txt_layoutbox(s)
	-- Writes a string representation of the current layout in a textbox widget
	local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
	s.mytxtlayoutbox:set_text(txt_l)
end

local wibox_offset_y = 10
function theme.at_screen_connect(s)
	-- Quake application
	s.quake = lain.util.quake({ app = awful.util.terminal })

	-- If wallpaper is a function, call it with the screen
	local wallpaper = theme.wallpaper
	if type(wallpaper) == "function" then
		wallpaper = wallpaper(s)
	end
	gears.wallpaper.maximized(wallpaper, s, true)

	-- Tags
	awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	--s.mypromptbox = awful.widget.prompt()

	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(my_table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 2, function()
			awful.layout.set(awful.layout.layouts[1])
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = awful.util.taglist_buttons,
		style = {
			font = "JetBrainsMono Nerd Font 13",
		},
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

	-- Create battery widget
	local baticon = wibox.widget.imagebox(theme.widget_battery)
	local bat = lain.widget.bat({
		full_notify = "off",
		settings = function()
			if bat_now.status and bat_now.status ~= "N/A" then
				if bat_now.ac_status == 1 then
					baticon:set_image(theme.widget_ac)
				elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
					baticon:set_image(theme.widget_battery_empty)
				elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
					baticon:set_image(theme.widget_battery_low)
				else
					baticon:set_image(theme.widget_battery)
				end
				widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
			else
				widget:set_markup(markup.font(theme.font, " AC "))
				baticon:set_image(theme.widget_ac)
			end
		end,
	})

	my_shape = function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 5)
	end

	-- Create the middle wibox
	s.mywibox = wibox({
		type = "dock",
		visible = true,
		screen = s,
		height = theme.wibox_height,
		width = dpi(230),
		shape = my_shape,
		bg = theme.bg_normal,
		fg = theme.fg_normal,
		y = wibox_offset_y,
		x = (s.geometry.width - dpi(230)) / 2,
		border_width = theme.border_width,
		border_color = colors.blue .. "AA",
	})
	-- Reserve space
	s.mywibox:struts({
		top = dpi(2 * wibox_offset_y + s.mywibox.height),
	})
	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		expand = "none",
		nil,
		clock,
		nil,
	})

	-- Left Wibox
	s.mywibox_tag = wibox({
		screen = s,
		x = 40,
		y = wibox_offset_y,
		type = "dock",
		visible = true,
		height = theme.wibox_height,
		width = dpi(335),
		shape = my_shape,
		bg = theme.bg_normal,
		fg = theme.fg_normal,
		border_width = theme.border_width,
		border_color = colors.blue .. "AA",
	})
	s.mywibox_tag:setup({
		layout = wibox.layout.align.horizontal,
		expand = "inside",
		first,
		s.mytaglist,
		nil,
	})

	-- Right wibox
	s.mywibox_wid = wibox({
		screen = s,
		x = 1540,
		y = wibox_offset_y,
		type = "dock",
		visible = true,
		height = theme.wibox_height,
		width = dpi(360),
		shape = my_shape,
		bg = theme.bg_normal,
		fg = theme.fg_normal,
		border_width = theme.border_width,
	})

	s.mywibox_wid:setup({
		layout = wibox.layout.align.horizontal,
		expand = "inside",
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			spr,
			spr,
			wibox.widget.systray(),
		},
		nil,
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			spr,
			mykeyboardlayout,
			spr,
			--theme.mpd.widget,
			--theme.mail.widget,
			--theme.fs.widget,
			volumewidget,
			spr,
			baticon,
			bat.widget,
			spr,
			s.mylayoutbox,
			spr,
		},
	})
end

return theme
