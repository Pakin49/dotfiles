############################################################
#                                                          #
#                       General config                     #
#                                                          #
############################################################

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

c.tabs.title.format = "{audio}{current_title}"
c.fonts.default_size = "10pt"
c.fonts.default_family = "JetBrains Mono Nerd Font"

c.fonts.web.size.default = 20
c.fonts.web.family.standard =  "Noto Serif"
c.fonts.web.family.serif =   "Noto Serif"
c.fonts.web.family.sans_serif = "Not Sans"

c.url.searchengines = {
# note - if you use duckduckgo, you can make use of its built in bangs, of which there are many! https://duckduckgo.com/bangs
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        'aw': 'https://wiki.archlinux.org/?search={}',
        'apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
        'gh': 'https://github.com/search?o=desc&q={}&s=stars',
        'yt': 'https://www.youtube.com/results?search_query={}',
        'ud': 'https://www.urbandictionary.com/define.php?term={}'
        }

c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']

c.auto_save.session = True # save tabs on quit/restart

############################################################
#                                                          #
#                        Privacy                           #
#                                                          #
############################################################
# privacy - adjust these settings based on your preference
config.set("completion.cmd_history_max_items", 200)
# config.set("content.private_browsing", True)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "no-3rdparty")
config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", False) # tsh keybind to toggle

config.set("content.javascript.clipboard", "access-paste")

# ads block
c.content.blocking.enabled = True
c.content.blocking.method = 'adblock' # uncomment this if you install python-adblock
c.content.blocking.adblock.lists = [
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/experimental.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2025.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-general.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-mobile.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/lan-block.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/ubo-link-shorteners.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/ubol-filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
]
#"https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt",
############################################################
#                                                          #
#                     Key binding                          #
#                                                          #
############################################################
config.bind('<space>d', 'config-cycle colors.webpage.darkmode.enabled true false')
config.bind('cm','clear-messages')

############################################################
#                                                          #
#                   Style and Colors                       #
#                                                          #
############################################################
# c.content.user_stylesheets = ["~/.config/qutebrowser/styles/youtube-tweaks.css"]
c.tabs.indicator.width = 0 # no tab indicators
'''
c.window.transparent = True # apparently not needed
c.colors.tabs.even.bg = "#00000000" # transparent tabs!!
c.colors.tabs.odd.bg = "#00000000"
c.colors.tabs.bar.bg = "#00000000"
'''
c.colors.webpage.preferred_color_scheme = "dark"
c.backend = 'webengine'

# dark mode setup
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
#config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# credits to theova/base16-qutebrowser for the original template

##########
# COLORS #
##########

# base16 colors but with variable names that 
# reflect what the color is mainly used for

bg_default = "#0e1013"          # main shade darkest
bg_lighter = "#1f2329"
bg_selection = "#282c34" #30363f
# "#545862"
fg_disabled = "#535965"
fg_default = "#a0a8b7"
# "#b6bdca"
bg_lightest = "#7a818e"         # main shade lightest
fg_error = "#e55561"            # red
# "#cc9057"                     # orange
bg_hint = "#e2b86b"             # yellow
fg_matched_text = "#8ebd6b"     # green
bg_passthrough_mode = "#48b0bd" # 
bg_insert_mode = "#4fa6ed"      # blue
bg_warning = "#bf68d9"          # purple
# "#8b3434"                     # dark red

############
# SETTINGS #
############
c.colors.completion.fg = fg_default
c.colors.completion.odd.bg = bg_lighter
c.colors.completion.even.bg = bg_default
c.colors.completion.category.fg = bg_hint
c.colors.completion.category.bg = bg_default
c.colors.completion.category.border.top = bg_default
c.colors.completion.category.border.bottom = bg_default
c.colors.completion.item.selected.fg = fg_default
c.colors.completion.item.selected.bg = bg_selection
c.colors.completion.item.selected.border.top = bg_selection
c.colors.completion.item.selected.border.bottom = bg_selection
c.colors.completion.item.selected.match.fg = fg_matched_text
c.colors.completion.match.fg = fg_matched_text
c.colors.completion.scrollbar.fg = fg_default
c.colors.completion.scrollbar.bg = bg_default
c.colors.contextmenu.disabled.bg = bg_lighter
c.colors.contextmenu.disabled.fg = fg_disabled
c.colors.contextmenu.menu.bg = bg_default
c.colors.contextmenu.menu.fg = fg_default
c.colors.contextmenu.selected.bg = bg_selection
c.colors.contextmenu.selected.fg = fg_default
c.colors.downloads.bar.bg = bg_default
c.colors.downloads.start.fg = bg_default
c.colors.downloads.start.bg = bg_insert_mode
c.colors.downloads.stop.fg = bg_default
c.colors.downloads.stop.bg = bg_passthrough_mode
c.colors.downloads.error.fg = fg_error
c.colors.hints.fg = bg_default
c.colors.hints.bg = bg_hint
c.colors.hints.match.fg = fg_default
c.colors.keyhint.fg = fg_default
c.colors.keyhint.suffix.fg = fg_default
c.colors.keyhint.bg = bg_default
c.colors.messages.error.fg = bg_default
c.colors.messages.error.bg = fg_error
c.colors.messages.error.border = fg_error
c.colors.messages.warning.fg = bg_default
c.colors.messages.warning.bg = bg_warning
c.colors.messages.warning.border = bg_warning
c.colors.messages.info.fg = fg_default
c.colors.messages.info.bg = bg_default
c.colors.messages.info.border = bg_default
c.colors.prompts.fg = fg_default
c.colors.prompts.border = bg_default
c.colors.prompts.bg = bg_default
c.colors.prompts.selected.bg = bg_selection
c.colors.prompts.selected.fg = fg_default
c.colors.statusbar.normal.fg = fg_matched_text
c.colors.statusbar.normal.bg = bg_default
c.colors.statusbar.insert.fg = bg_default
c.colors.statusbar.insert.bg = bg_insert_mode
c.colors.statusbar.passthrough.fg = bg_default
c.colors.statusbar.passthrough.bg = bg_passthrough_mode
c.colors.statusbar.private.fg = bg_default
c.colors.statusbar.private.bg = bg_lighter
c.colors.statusbar.command.fg = fg_default
c.colors.statusbar.command.bg = bg_default
c.colors.statusbar.command.private.fg = fg_default
c.colors.statusbar.command.private.bg = bg_default
c.colors.statusbar.caret.fg = bg_default
c.colors.statusbar.caret.bg = bg_warning
c.colors.statusbar.caret.selection.fg = bg_default
c.colors.statusbar.caret.selection.bg = bg_insert_mode
c.colors.statusbar.progress.bg = bg_insert_mode
c.colors.statusbar.url.fg = fg_default
c.colors.statusbar.url.error.fg = fg_error
c.colors.statusbar.url.hover.fg = fg_default
c.colors.statusbar.url.success.http.fg = bg_passthrough_mode
c.colors.statusbar.url.success.https.fg = fg_matched_text
c.colors.statusbar.url.warn.fg = bg_warning
c.colors.tabs.bar.bg = bg_default
c.colors.tabs.indicator.start = bg_insert_mode
c.colors.tabs.indicator.stop = bg_passthrough_mode
c.colors.tabs.indicator.error = fg_error
c.colors.tabs.odd.fg = fg_default
c.colors.tabs.odd.bg = bg_default
c.colors.tabs.even.fg = fg_default
c.colors.tabs.even.bg = bg_selection
c.colors.tabs.pinned.even.bg = bg_passthrough_mode
c.colors.tabs.pinned.even.fg = bg_lightest
c.colors.tabs.pinned.odd.bg = fg_matched_text
c.colors.tabs.pinned.odd.fg = bg_lightest
c.colors.tabs.pinned.selected.even.bg = bg_selection
c.colors.tabs.pinned.selected.even.fg = fg_default
c.colors.tabs.pinned.selected.odd.bg = bg_selection
c.colors.tabs.pinned.selected.odd.fg = fg_default
c.colors.tabs.selected.odd.fg = bg_insert_mode #fg_default
c.colors.tabs.selected.odd.bg = bg_default
c.colors.tabs.selected.even.fg = bg_insert_mode #fg_default
c.colors.tabs.selected.even.bg = bg_selection
# c.colors.webpage.bg = bg_default
