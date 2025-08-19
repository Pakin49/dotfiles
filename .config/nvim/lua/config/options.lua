-------------------- Neovim options --------------------
-- Basic settings
vim.opt.number = true         -- enable line number
vim.opt.relativenumber = true --enable relative linenumber
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.sidescroll = 8
vim.opt.sidescrolloff = 10

-- Color scheme
vim.opt.termguicolors = true
require("onedark").load() -- set theme
-- Add transparency
vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
vim.api.nvim_set_hl(0,"NormalNC",{bg = "none"})
vim.api.nvim_set_hl(0,"EndOfBuffer",{bg = "none"})

-- Indentatios
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2      -- a real tab is 2 spaces
vim.opt.softtabstop = 2  -- editing uses 2 spaces
vim.opt.shiftwidth = 2   -- auto-indent uses 2 spaces

-- Bufferline still not work
vim.opt.showtabline = 2

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
-- Set vim so that they text don't push to new line when there is not enough space
-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
vim.g.have_nerd_font = true

-- Synce neovim clipboard with OS
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}
-------------------- Plugins options --------------------
