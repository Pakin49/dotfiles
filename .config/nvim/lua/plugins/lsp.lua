--For a list of all available packages, see https://mason-registry.dev/registry/list.
local lsp_servers = {
        "lua_ls",
        "pyright",
        "clangd",
        "svlangserver"
}

return {
  {
      "mason-org/mason.nvim",
      opts = {}
  },
  {
      "mason-org/mason-lspconfig.nvim",
      opts = {ensure_installed = lsp_servers},
  },
  {
      "neovim/nvim-lspconfig",

      config = function()

        local lspconfig = require("lspconfig")
        for _ ,lsp in ipairs(lsp_servers) do
		      lspconfig[lsp].setup({})
        end
      end
  }
}

