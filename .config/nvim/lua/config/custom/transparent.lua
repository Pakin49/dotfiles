local m = {}

-- save the current theme value
local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
local normal_nc = vim.api.nvim_get_hl(0, { name = "NormalNC" })
local end_of_buffer = vim.api.nvim_get_hl(0, { name = "EndOfBuffer" })
local line_nr = vim.api.nvim_get_hl(0, { name = "LineNr" })
local sign_column = vim.api.nvim_get_hl(0, { name = "SignColumn" })

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
		-- Restore original highlight groups completely
		vim.api.nvim_set_hl(0, "Normal", normal)
		vim.api.nvim_set_hl(0, "NormalNC", normal_nc)
		vim.api.nvim_set_hl(0, "EndOfBuffer", end_of_buffer)
		vim.api.nvim_set_hl(0, "LineNr", line_nr)
		vim.api.nvim_set_hl(0, "SignColumn", sign_column)
		m.transparents_enabled = false
	else
		-- Make transparent while preserving foreground colors
		vim.api.nvim_set_hl(0, "Normal", vim.tbl_extend("force", normal, { bg = "none" }))
		vim.api.nvim_set_hl(0, "NormalNC", vim.tbl_extend("force", normal_nc, { bg = "none" }))
		vim.api.nvim_set_hl(0, "EndOfBuffer", vim.tbl_extend("force", end_of_buffer, { bg = "none" }))
		vim.api.nvim_set_hl(0, "LineNr", vim.tbl_extend("force", line_nr, { bg = "none" }))
		vim.api.nvim_set_hl(0, "SignColumn", vim.tbl_extend("force", sign_column, { bg = "none" }))
		m.transparents_enabled = true
	end
	save_transparent_state()
end

-- this run when neovim start
get_transparent_state()
if m.transparents_enabled == true then
	vim.api.nvim_set_hl(0, "Normal", vim.tbl_extend("force", normal, { bg = "none" }))
	vim.api.nvim_set_hl(0, "NormalNC", vim.tbl_extend("force", normal_nc, { bg = "none" }))
	vim.api.nvim_set_hl(0, "EndOfBuffer", vim.tbl_extend("force", end_of_buffer, { bg = "none" }))
	vim.api.nvim_set_hl(0, "LineNr", vim.tbl_extend("force", line_nr, { bg = "none" }))
	vim.api.nvim_set_hl(0, "SignColumn", vim.tbl_extend("force", sign_column, { bg = "none" }))
end

return m
