return {
  'navarasu/onedark.nvim',
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'dark',
      transparent = true,
      highlights = {
        --['@lsp.type.comment'] = { fg = '#7F848E', fmt = 'italic' },
      },
    }
    -- Enable theme
    require('onedark').load()
  end, --]]
}
