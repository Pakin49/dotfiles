return {
  -- [[
  'navarasu/onedark.nvim',
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'darker',
      transparent = true,
    }
    -- Enable theme
    --require('onedark').load()
  end, --]]
  -- [[
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Ensure it loads first
    config = function()
      require('onedarkpro').setup {
        options = {
          transparency = true,
        },
      }
      -- to use insert this into init.lua
      -- vim.cmd 'colorscheme onedark_dark'
    end, --]]
  },
}
