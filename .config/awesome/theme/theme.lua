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
theme.font = "JetBrains Mono Nerd Font Propo 11"
theme.desktop_font = "JetBrains Mono Nerd Font Propo 11"

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
-- Yank from holo
theme.taglist_squares_sel = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel = theme.dir .. "/icons/square_unsel.png"
-- Titlebar
theme.titlebar_bg_focus = colors.bg
theme.titlebar_bg_normal = colors.bg_light
theme.titlebar_fg_focus = colors.fg_light
theme.titlebar_fg_normal = colors.fg
theme.titlebar_border_focus = colors.blue
theme.titlebar_border_normal = colors.line

-- Hotkeys
theme.hotkeys_modifiers_fg = colors.fg_light

-- Systray
theme.systray_icon_spacing = dpi(5)
theme.bg_systray = colors.bg_lighter

theme.wibox_height = dpi(30)
local wibox_offset_y = 5

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
theme.widget_net = theme.dir .. "/icons/net.png"
theme.widget_temp = theme.dir .. "/icons/temp.png"
-- lain related
theme.layout_txt_cascade = "[cascade]"
theme.layout_txt_cascadetile = "[cascadetile]"
theme.layout_txt_centerwork = "[centerwork]"
theme.layout_txt_termfair = "[termfair]"
theme.layout_txt_centerfair = "[centerfair]"

local markup = lain.util.markup

-- Clock
clockwidget = wibox.widget.textclock()
clockwidget.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
	attach_to = { clock },
	notification_preset = {
		fg = theme.fg_normal,
		bg = theme.bg_normal,
		position = "top_right",
		font = theme.font,
	},
})

--[[MPD
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
-- [[ commented because it needs Gio/Glib >= 2.54
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
-- Simple volume widget (icon + text)
local volume_icon = wibox.widget.textbox()
local volume_text = wibox.widget.textbox()

theme.volume = lain.widget.alsa({
	settings = function()
		local vol_icon = "  "
		if volume_now.status == "off" then
			vol_icon = "  "
		elseif tonumber(volume_now.level) <= 30 then
			vol_icon = "  "
		end

		volume_icon:set_markup(markup.font(theme.desktop_font, markup.fg.color(colors.fg, vol_icon)))
		volume_text:set_markup(markup.font(theme.font, volume_now.level .. "% "))
	end,
})
-- Add click functionality
local volume_widget = wibox.widget({
	volume_icon,
	volume_text,
	layout = wibox.layout.fixed.horizontal,
})

volume_widget:buttons(my_table.join(
	awful.button({}, 1, function()
		awful.spawn(string.format("%s -e alsamixer", terminal))
	end),
	awful.button({}, 3, function()
		os.execute("amixer -q set Master toggle")
		theme.volume.update()
	end),
	awful.button({}, 4, function()
		os.execute("amixer -q set Master 5%+")
		theme.volume.update()
	end),
	awful.button({}, 5, function()
		os.execute("amixer -q set Master 5%-")
		theme.volume.update()
	end)
)) -- Weather
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

-- helper function to create styled boxes/containers
local function widgetbox(wid)
	local padded_widget = wibox.container.margin(wid, dpi(8), dpi(8), 0, 0)

	local bg_widget = wibox.container.background(padded_widget, colors.arch_blue .. "11")
	bg_widget.fg = theme.fg_normal
	bg_widget.shape = function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 6)
	end
	bg_widget.shape_border_width = 1
	bg_widget.shape_border_color = colors.arch_blue

	-- External margins (spacing between widgets)
	return wibox.container.margin(bg_widget, 0, 0, dpi(2), dpi(2))
end

-- Metho

-- Separators
local awesome_icon = wibox.widget.textbox(markup.font("Hack Nerd Font 15", "  "))
local arch_icon = wibox.widget.textbox(markup.font("Hack Nerd Font 20", markup.fg.color(colors.arch_blue, "   ")))
local space = wibox.widget.textbox("  ")

function theme.at_screen_connect(s)
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

	s.layoutbox = awful.widget.layoutbox(s)
	s.layoutbox:buttons(my_table.join(
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
	s.mylayoutbox = wibox.container.margin(s.layoutbox, 0, 0, dpi(8), dpi(8))

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
	local baticon = wibox.widget.textbox(" 󱊣 ")
	local bat = lain.widget.bat({
		full_notify = "off",
		settings = function()
			local bat_icon = " 󱊣 "
			if bat_now.status and bat_now.status ~= "N/A" then
				if bat_now.ac_status == 1 then
					bat_icon = " 󰂄 "
				elseif bat_now.perc and tonumber(bat_now.perc) <= 33 then
					bat_icon = " 󱊡 "
				elseif bat_now.perc and tonumber(bat_now.perc) <= 66 then
					bat_icon = " 󱊢 "
				else
					bat_icon = " 󱊣 "
				end
				baticon:set_markup(markup.font(theme.font, bat_icon))
				widget:set_markup(markup.font(theme.font, bat_now.perc .. " % "))
			else
				widget:set_markup(markup.font(theme.font, "AC "))
				baticon:set_markup(markup.font(theme.font, "  "))
			end
		end,
	})

	local battery_widget = wibox.widget({
		baticon,
		bat.widget,
		layout = wibox.layout.fixed.horizontal,
	})

	myshape = function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 8)
	end

	local widget_highlight = function(wid)
		local background = wibox.container.background(wid, colors.bg .. "88", myshape)
		return wibox.container.margin(background, dpi(5), dpi(5), dpi(5), dpi(5))
	end

	-- [[ unused wibar
	s.mywibar = awful.wibar({
		position = "top",
		screen = s,
		height = theme.wibox_height + 2 * wibox_offset_y,
		bg = colors.bg .. "88",
		fg = theme.fg_normal,
	})
	-- Add widgets to the wibox
	s.mywibar:setup({
		layout = wibox.layout.align.horizontal,
		expand = "none",
		{
			wibox.container.margin(awesome_icon, dpi(5), dpi(15), 0, 0),
			space,
			s.mytaglist,
			layout = wibox.layout.align.horizontal,
			expand = "inside",
		},
		arch_icon,
		{
			layout = wibox.layout.fixed.horizontal,
			mykeyboardlayout,
			space,
			--theme.mpd.widget,
			--theme.mail.widget,
			--theme.fs.widget,
			widget_highlight(volume_widget),
			space,
			widget_highlight(battery_widget),
			space,
			widget_highlight(clockwidget),
			space,
			s.mylayoutbox,
			space,
		},
	}) --]]
end

return theme
