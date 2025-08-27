local M = {}

M.terminal_state = {
  buf = nil,
  win = nil,
  is_open = false,
}

function M.FloatingTerminal()
  local ts = M.terminal_state

  if ts.is_open and vim.api.nvim_win_is_valid(ts.win) then
    vim.api.nvim_win_close(ts.win, false)
    ts.is_open = false
    return
  end

  if not ts.buf or not vim.api.nvim_buf_is_valid(ts.buf) then
    ts.buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(ts.buf, 'bufhidden', 'hide')
  end

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  ts.win = vim.api.nvim_open_win(ts.buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  vim.api.nvim_win_set_option(ts.win, 'winblend', 0)
  vim.api.nvim_win_set_option(ts.win, 'winhighlight',
    'Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder')

  vim.api.nvim_set_hl(0, "FloatingTermNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatingTermBorder", { bg = "none" })

  local has_terminal = false
  for _, line in ipairs(vim.api.nvim_buf_get_lines(ts.buf, 0, -1, false)) do
    if line ~= "" then has_terminal = true break end
  end

  if not has_terminal then
    vim.fn.termopen(os.getenv("SHELL"))
  end

  ts.is_open = true
  vim.cmd("startinsert")

  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = ts.buf,
    callback = function()
      if ts.is_open and vim.api.nvim_win_is_valid(ts.win) then
        vim.api.nvim_win_close(ts.win, false)
        ts.is_open = false
      end
    end,
    once = true,
  })
end

function M.CloseFloatingTerminal()
  local ts = M.terminal_state
  if ts.is_open and vim.api.nvim_win_is_valid(ts.win) then
    vim.api.nvim_win_close(ts.win, false)
    ts.is_open = false
  end
end

return M
