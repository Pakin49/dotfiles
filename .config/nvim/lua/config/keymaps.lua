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
vim.keymap.set("n", "<leader>c", ":q!<cr>", { desc = "Quit without save" })

-- windows
vim.keymap.set("n", "<leader>sl", ":vertical resize +20<cr>", { desc = "[S]plit vertical resize +20" })
vim.keymap.set("n", "<leader>sh", ":vertical resize -20<cr>", { desc = "[S]plit vertical resize -20" })
vim.keymap.set("n", "<leader>sk", ":resize +10<cr>", { desc = "[S]plit horizontal resize +10" })
vim.keymap.set("n", "<leader>sj", ":resize -10<cr>", { desc = "[S]plit horizontal resize -10" })
vim.keymap.set("n", "<leader>sv", ":vertical split<cr>", { desc = "[S]plit [V]ertically " })
vim.keymap.set("n", "<leader>ss", ":split<cr>", { desc = "[S]plit Horontally" })
vim.keymap.set("n", "<leader>ss", ":split<cr>", { desc = "[S]plit Horontally" })

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>", { desc = "[N]ext Buffer" })
vim.keymap.set("n", "<leader>p", ":bp<cr>", { desc = "[P]revious Buffer" })
vim.keymap.set("n", "<leader>x", ":bd<cr>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bl", ":b#<cr>", { desc = "[Last] Open Buffer" })

--------------------  Transparency --------------------
local transparent = require("config.custom.transparent")
vim.keymap.set("n", "<leader>tc", transparent.toggle_transparent, { desc = "[Toggle] [C}olors" })

-------------------- Floating terminal --------------------

local term = require("config.custom.terminal")

vim.keymap.set(
	"n",
	"<leader>tt",
	term.FloatingTerminal,
	{ noremap = true, silent = true, desc = "[T]oggle floating [T]erminal" }
)
vim.keymap.set("t", "<Esc>", function()
	local ts = term.terminal_state
	if ts.is_open then
		vim.api.nvim_win_close(ts.win, false)
		ts.is_open = false
	end
end, { noremap = true, silent = true, desc = "Close floating terminal from terminal mode" })
