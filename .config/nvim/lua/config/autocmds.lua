--luacheck: globals vim
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- LSP
-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.lsp.stop_client(vim.lsp.get_clients())
  end,
})
vim.api.nvim_create_autocmd('LspDetach', {
  callback = function(args)
    -- Get the detaching client
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- Remove the autocommand to format the buffer on save, if it exists
    if client:supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({
        event = 'BufWritePre',
        buffer = args.buf,
      })
    end
  end,
})


-- Terminal
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

-- Linter
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint()
  end,
})

-- Man page
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "man" },
  callback = function()
    vim.cmd("wincmd |") -- max width
    vim.cmd("wincmd _") -- max height
  end,
})
