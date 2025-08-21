-- Add transparency
local M = {}


--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
--vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
local normal_nc = vim.api.nvim_get_hl(0, { name = "NormalNC" })
local end_of_buffer = vim.api.nvim_get_hl(0, { name = "EndOfBuffer" })

M.transparents_enabled = true
function M.toggle_transparent()
  if M.transparents_enabled then
    vim.api.nvim_set_hl(0, "Normal", { bg = normal.bg })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = normal_nc.bg})
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = end_of_buffer.bg })
    M.transparents_enabled = false
  else
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    M.transparents_enabled = true
  end
end
return M
