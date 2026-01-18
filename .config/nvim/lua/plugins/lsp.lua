--For a list of all available packages, see https://mason-registry.dev/registry/list.
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {},
			},
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_installed = {
						--lsp
						"lua_ls",
						"pyright",
						"clangd",
						"jsonls",
						"verible",
					},
					automatic_installation = true,
				},
			},
			"saghen/blink.cmp",
		},
		opts = {
			servers = {
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
        asmlsp = {},
				verible = {
					cmd = { "verible-verilog-ls", "--rules_config_search" },
				},
				jsonls = {
					filetypes = { "json", "jsonc" },
					settings = {
						json = {
							validate = { enable = true },
						},
					},
				},
			},
		},
		config = function(_, opts)
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				vim.lsp.config(server, config)
			end
		end,
	},
}
