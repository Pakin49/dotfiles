local m = {}

-- save the current theme value
local normal = vim.api.nvim_get_hl(0, { name = "normal" })
local normal_nc = vim.api.nvim_get_hl(0, { name = "normalnc" })
local end_of_buffer = vim.api.nvim_get_hl(0, { name = "endofbuffer" })

local home_dir = os.getenv("HOME")
local file_path = home_dir .. "/.local/state/nvim/custom/transparent.txt"

local get_transparent_state = function()
	local file = io.open(file_path, "r")
	if file then
		m.transparents_enabled = file:read()
	else
		os.execute("mkdir -p " .. home_dir .. "/.local/state/custom/nvim  && echo 'false' > " .. file_path)
		m.transparents_enabled = false
	end
end

local save_transparent_state = function()
	local file = io.open(file_path, "w")
	file:write(tostring(m.transparents_enabled))
  file:close()
end

function m.toggle_transparent()
	if m.transparents_enabled then
		vim.api.nvim_set_hl(0, "normal", { bg = normal.bg })
		vim.api.nvim_set_hl(0, "normalnc", { bg = normal_nc.bg })
		vim.api.nvim_set_hl(0, "endofbuffer", { bg = end_of_buffer.bg })
		m.transparents_enabled = false
	else
		vim.api.nvim_set_hl(0, "normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "normalnc", { bg = "none" })
		vim.api.nvim_set_hl(0, "endofbuffer", { bg = "none" })
		m.transparents_enabled = true
	end
	save_transparent_state()
end

get_transparent_state()
if m.transparents_enabled == true then
	vim.api.nvim_set_hl(0, "normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "normalnc", { bg = "none" })
	vim.api.nvim_set_hl(0, "endofbuffer", { bg = "none" })
	m.transparents_enabled = true
end
return m
