return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("kanagawa").setup({
				theme = "dragon",
				transparent = false,
        background = {
          dark = "dragon"
        }
			})
			-- Enable theme
			require("kanagawa").load()
		end,
	},
}
