return {
  'navarasu/onedark.nvim',
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'darker',
      transparent = true,
      highlights = {
        ['@lsp.type.comment'] = {
          fg = '#D6D6D6',
          fmt = 'italic',
        },
      },
    }
    -- Enable theme
    require('onedark').load()
  end, --]]
}
