--For a list of all available packages, see https://mason-registry.dev/registry/list.
local lsp_servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = {
					-- Disable workspace altogether for lightweight operation
					checkThirdParty = false,
					library = {}, -- Don't load any libraries
				},
			},
		},
	},
	pyright = {},
	clangd = {},
	svlangserver = {},
}

-- Convert to array for ensure_installed
local ensure_installed = vim.tbl_keys(lsp_servers)

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			-- Get capabilities from blink.cmp
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- Setup mason-lspconfig
			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed, -- Fixed: use the array
				automatic_installation = false,
				handlers = {
					-- Default handler for all servers
					function(server_name)
						local server = lsp_servers[server_name] or {} -- Fixed: use lsp_servers
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
