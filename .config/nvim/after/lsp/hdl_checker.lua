---@type vim.lsp.Config
return {
  cmd = { 'hdl_checker', '--lsp' },
  filetypes = { 'vhdl', 'verilog', 'systemverilog' }, 

  root_markers = { '.git' },
}
