local m = {}

-- save the current theme value
local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
local normal_nc = vim.api.nvim_get_hl(0, { name = "NormalNC" })
local end_of_buffer = vim.api.nvim_get_hl(0, { name = "EndOfBuffer" })

local home_dir = os.getenv("HOME")
local file_path = home_dir .. "/.local/state/nvim/custom/transparent.txt"

local get_transparent_state = function()
	local file = io.open(file_path, "r")
	if file then
		local content = file:read()
		m.transparents_enabled = (content == "true")
		file:close()
	else
		os.execute("mkdir -p " .. home_dir .. "/.local/state/nvim/custom  && echo 'false' > " .. file_path)
		m.transparents_enabled = false
	end
end

local save_transparent_state = function()
	local file = io.open(file_path, "w")
	if file then
		file:write(tostring(m.transparents_enabled) .. "\n")
		file:close()
	end
end

function m.toggle_transparent()
	if m.transparents_enabled then
		vim.api.nvim_set_hl(0, "Normal", { bg = normal.bg })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = normal_nc.bg })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = end_of_buffer.bg })
vim.api.nvim_set_hl(0, "SignColumn", { bg = normal.bg }) 
		m.transparents_enabled = false
	else
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none"}) 
		m.transparents_enabled = true
	end
	save_transparent_state()
end

-- this run when neovim start
get_transparent_state()
if m.transparents_enabled == true then
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none"}) 
	m.transparents_enabled = true
end
vim.api.nvim_set_hl(0, "TermCursor", { bg = "none" })
return m
