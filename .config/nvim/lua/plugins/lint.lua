return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			markdown = { "vale" },
      --verilog = { "verible_verilog_lint" }, -- or "iverilog"
			python = { "pylint" }, -- or "ruff"
			lua = { "luacheck" },
			--c = { "cpplint" },
		}
	end,
}
