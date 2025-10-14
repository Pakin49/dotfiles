return {
	"Vigemus/iron.nvim",
	config = function()
		local iron = require("iron.core")
		local view = require("iron.view")

		iron.setup({
			config = {
				should_map_plug = false,
				scratch_repl = true,
				repl_definition = {
					python = {
						command = { "ipython" },
						format = require("iron.fts.common").bracketed_paste,
						block_dividers = { "# %%", "#%%" },
					},
				},
				-- repl_open_cmd = view.bottom(40),

				-- Vertical split options:
				-- repl_open_cmd = "vertical botright 80 split"
				-- repl_open_cmd = view.split.vertical.botright(50)
				-- repl_open_cmd = view.split.vertical.botright(0.61903398875)  -- proportion
				-- repl_open_cmd = view.split("40%")

				-- With window options:
				repl_open_cmd = view.split.vertical.botright("40%", {
					winfixwidth = false,
					winfixheight = false,
					number = true,
				}),
			},
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true,
		})
	end,
	dependencies = {
		"kana/vim-textobj-user",
		"kana/vim-textobj-line",
		"GCBallesteros/vim-textobj-hydrogen",
		{
			"GCBallesteros/jupytext.vim",
			init = function()
				vim.g.jupytext_fmt = "py"
				vim.g.jupytext_style = "hydrogen"
			end,
		},
	},
}
