return {
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "darker",
				transparent = true,
        code_style = {
          comments = 'none',
        },
				colors = {
					black = "#0a0b10", -- grey1 (dark)
					bg0 = "#14161b", --"#0a0b10", -- grey2 (dark)
					bg1 = "#2c2e33", -- grey3 (dark)
					bg2 = "#4f5258", -- grey4 (dark)
					bg3 = "#4f5258", -- grey4 (dark)
					bg_d = "#0a0b10", -- grey1 (dark) - darker than bg0
					bg_blue = "#9fd8ff", -- blue (light)
					bg_yellow = "#f4d88c", -- yellow (light)
					fg = "#d7dae1", -- grey2 (light)
					purple = "#ffc3fa", -- magenta (light)
					green = "#aaedb7", -- green (light)
					orange = "#f4d88c", -- yellow (light) - closest to orange
					blue = "#9fd8ff", -- blue (light)
					yellow = "#f4d88c", -- yellow (light)
					cyan = "#83efef", -- cyan (light)
					red = "#ffbcb5", -- red (light)
					grey = "#4f5258", -- grey4 (dark)
					light_grey = "#9b9ea4", -- grey4 (light)
					dark_cyan = "#007676", -- cyan (dark)
					dark_red = "#5e0009", -- red (dark)
					dark_yellow = "#6e5600", -- yellow (dark)
					dark_purple = "#4c0049", -- magenta (dark)
					diff_add = "#015825", -- green (dark)
					diff_delete = "#re0009", -- red (dark)
					diff_change = "#005078", -- blue (dark)
					diff_text = "#007676", -- cyan (dark)
				},
			})
			-- Enable theme
			--require("onedark").load()
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				-- ...
			})

      --vim.cmd("colorscheme github_dark_default")
		end,
	},
}
