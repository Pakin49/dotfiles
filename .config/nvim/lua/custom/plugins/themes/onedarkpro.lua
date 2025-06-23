return {
  'olimorris/onedarkpro.nvim',
  priority = 1000, -- Ensure it loads first
  config = function()
    require('onedarkpro').setup {
      highlights = {
        Comment = { italic = true },
      },
      options = {
        transparency = true,
      },
    }
    -- to use insert this into init.lua
    vim.cmd 'colorscheme onedark'
  end, --]]
}
