-- luacheck: globals vim
------------------- Neovim keymap --------------------
-- space bar leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- ignore capitailzation mistakes
vim.cmd("ca W w")
vim.cmd("ca Q q")
vim.cmd("ca WQ wq")
vim.cmd("ca Wq wq")
-- test bowen
vim.keymap.set("n", "]b", [[:silent /\v[\{\[\(\'"":]<CR>:nohlsearch<CR>]])
vim.keymap.set("n", "[b", [[:silent ?\v[\{\[\(\'"":]<CR>:nohlsearch<CR>]])
--vim.keymap.set("n", "<leader>q", ":q<cr>", { desc = "[Q]uit Vim!!" })
--im.keymap.set("n", "<leader>w", ":w<cr>", { desc = "[W]rite buffer" })
--vim.keymap.set("n", "<leader>c", ":q!<cr>", { desc = "Quit without save" })

-- windows
--vim.keymap.set("n", "<leader>sl", ":vertical resize +20<cr>", { desc = "[S]plit vertical resize +20" })
--vim.keymap.set("n", "<leader>sh", ":vertical resize -20<cr>", { desc = "[S]plit vertical resize -20" })
--vim.keymap.set("n", "<leader>sk", ":resize +10<cr>", { desc = "[S]plit horizontal resize +10" })
--vim.keymap.set("n", "<leader>sj", ":resize -10<cr>", { desc = "[S]plit horizontal resize -10" })
--vim.keymap.set("n", "<leader>sv", ":vertical split<cr>", { desc = "[S]plit [V]ertically " })
--vim.keymap.set("n", "<leader>ss", ":split<cr>", { desc = "[S]plit Horontally" })

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>", { desc = "[N]ext Buffer" })
vim.keymap.set("n", "<leader>p", ":bp<cr>", { desc = "[P]revious Buffer" })
vim.keymap.set("n", "<leader>x", ":bd<cr>", { desc = "[D]elete [B]uffer" })
vim.keymap.set("n", "<leader>bl", ":b#<cr>", { desc = "[Last] Open Buffer" })

-- Diagnostic
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { desc = "Show [D]iagnostic" })

local function ToggleRelative()
	vim.wo.relativenumber = not vim.wo.relativenumber
end
vim.keymap.set("n", "<leader>tr", ToggleRelative, { desc = "[T]oggle [R]elative line number" })


-------------------- Terminal --------------------
vim.keymap.set("n", "<leader>tt", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 8)
end)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})

-------------------- Plugins keymap --------------------

