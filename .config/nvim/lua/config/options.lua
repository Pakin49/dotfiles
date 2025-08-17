-------------------- Neovim options --------------------
vim.opt.nu = true             -- enable line number
vim.opt.relativenumber = true --enable relative linenumber

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
-- Set vim so that they text don't push to new line when there is not enough space
vim.opt.wrap = false
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 5

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
vim.g.have_nerd_font = true

-- Tabs behaviour
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2      -- a real tab is 2 spaces
vim.opt.softtabstop = 2  -- editing uses 2 spaces
vim.opt.shiftwidth = 2   -- auto-indent uses 2 spaces

-- Synce neovim clipboard with OS
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})
-------------------- Plugins options --------------------
vim.opt.termguicolors = true
require("onedark").load()
