------------------- Neovim keymap --------------------
-- space bar leader key
vim.g.mapleader = " "
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- ignore capitailzation mistakes
vim.cmd("ca W w")
vim.cmd("ca Q q")
vim.cmd("ca WQ wq")
vim.cmd("ca Wq wq")

vim.keymap.set("n", "<leader>q", ":q<cr>", { desc = "[Q]uit Vim!!" })
vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "[W]rite buffer" })
--vim.keymap.set("n", "<leader>c", ":q!<cr>", { desc = "Quit without save" })

-- windows
vim.keymap.set("n", "<leader>sl", ":vertical resize +20<cr>", { desc = "[S]plit vertical resize +20" })
vim.keymap.set("n", "<leader>sh", ":vertical resize -20<cr>", { desc = "[S]plit vertical resize -20" })
vim.keymap.set("n", "<leader>sk", ":resize +10<cr>", { desc = "[S]plit horizontal resize +10" })
vim.keymap.set("n", "<leader>sj", ":resize -10<cr>", { desc = "[S]plit horizontal resize -10" })
vim.keymap.set("n", "<leader>sv", ":vertical split<cr>", { desc = "[S]plit [V]ertically " })
vim.keymap.set("n", "<leader>ss", ":split<cr>", { desc = "[S]plit Horontally" })

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>", { desc = "[N]ext Buffer" })
vim.keymap.set("n", "<leader>p", ":bp<cr>", { desc = "[P]revious Buffer" })
vim.keymap.set("n", "<leader>x", ":bd<cr>", { desc = "[D]elete [B]uffer" })
vim.keymap.set("n", "<leader>bl", ":b#<cr>", { desc = "[Last] Open Buffer" })

-- Diagnostic
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { desc = "Show [D]iagnostic" })

function ToggleRelative()
  vim.wo.relativenumber = not vim.wo.relativenumber
end
vim.keymap.set("n", "<leader>tr", ToggleRelative, { desc = "[T]oggle [R]elative line number"})

--------------------  Transparency --------------------
local transparent = require("config.custom.transparent")
vim.keymap.set("n", "<leader>tc", transparent.toggle_transparent, { desc = "[Toggle] [C}olors" })

-------------------- Floating terminal --------------------

vim.keymap.set("n", "<leader>tt", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0,8)
end)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>",{})


-------------------- Plugins keymap --------------------
-- oil
local oil = require("oil")
vim.keymap.set("n", "<leader>e", ":Oil<cr>", { desc = "Oil file management" })
vim.keymap.set("n", "<leader>th", oil.toggle_hidden, { desc = "[T]oggle [H]idden files" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

--Autopairs
vim.keymap.set("n", "<leader>tp", ":lua require('nvim-autopairs').toggle()<cr>", { desc = "[T]oggle auto [P]airs" })

-- Lsp
-- Only create this keymap when lsp attach to buffer
-- even this is auto command I put it here since it's done to define keymap in specific buffer
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.keymap.set(
			"n",
			"K",
			vim.lsp.buf.hover,
			{ desc = "Displays hover information about the symbol under the cursor" }
		)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to definition" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[G]oto Code [A]ction" })
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
		vim.keymap.set("n", "grr", builtin.lsp_references, { buffer = ev.buf, desc = "[G]oto [R]efferences" })
	end,
})

-- auto formatting
vim.keymap.set("", "<leader>bf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[B]uffer [F]ormat" })

-- tmux
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-\\>", ":TmuxNavigatePrevious<CR>")

-- iron
-- [[
local iron = require("iron.core")
vim.keymap.set("n", "<space>irs", "<cmd>IronRepl<cr>", { desc = "[I]ron [R]EPL [S]tart" })
vim.keymap.set("n", "<space>irr", "<cmd>IronRestart<cr>", { desc = "[I]ron [R]EPL [Restart]" })
vim.keymap.set("n", "<space>irf", "<cmd>IronFocus<cr>", { desc = "[I]ron [R]EPL [F]ocus" })
vim.keymap.set("n", "<space>irh", "<cmd>IronHide<cr>", { desc = "[I]ron [R]EPL [H]ide" })
vim.keymap.set("n", "<space>ic", function()
  iron.send(nil, "\x0c")  -- Ctrl-L works universally
end, {desc = "[I]ron [C]lear"})
-- Send code keymaps
vim.keymap.set("n", "<space>isp", function()
	iron.send_paragraph()
end, { desc = "[I]ron [S]end [P]aragraph" })

vim.keymap.set("n", "<space>isb", function()
	iron.send_code_block()
end, { desc = "[I]ron [S]end Code [Block]"})

vim.keymap.set("n", "<space>isl", function()
	iron.send_line()
end, { desc = "[I]ron [S]end [L]ine" })

vim.keymap.set("v", "<space>is", function()
	iron.visual_send()
end, { desc = "[I]ron [S]end" })

vim.keymap.set("n", "<space>isc", function()
	iron.send_until_cursor()
end, { desc = "[I]ron [S]end Until [C]ursor" })

vim.keymap.set("n", "<space>isf", function()
	iron.send_file()
end, { desc = "[I]ron [S]end [F]ile" })
--]]
