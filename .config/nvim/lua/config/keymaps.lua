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
vim.keymap.set("n", "<leader>s<left>", ":vertical resize +20<cr>", { desc = "[S]plit vertical resize +20" })
vim.keymap.set("n", "<leader>s<right>", ":vertical resize -20<cr>", { desc = "[S]plit vertical resize -20" })
vim.keymap.set("n", "<leader>s<up>", ":resize +10<cr>", { desc = "[S]plit horizontal resize +10" })
vim.keymap.set("n", "<leader>s<down>", ":resize -10<cr>", { desc = "[S]plit horizontal resize -10" })

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>", { desc = "[N]ext Buffer" })
vim.keymap.set("n", "<leader>p", ":bp<cr>", { desc = "[P]revious Buffer" })
vim.keymap.set("n", "<leader>x", ":bd<cr>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bl", ":b#<cr>", { desc = "[Last] Open Buffer" })

-------------------- Floating terminal --------------------

local term = require("config.custom.terminal")

vim.keymap.set(
	"n",
	"<leader>t",
	term.FloatingTerminal,
	{ noremap = true, silent = true, desc = "Toggle floating terminal" }
)
vim.keymap.set("t", "<Esc>", function()
	local ts = term.terminal_state
	if ts.is_open then
		vim.api.nvim_win_close(ts.win, false)
		ts.is_open = false
	end
end, { noremap = true, silent = true, desc = "Close floating terminal from terminal mode" })

-------------------- Plugins keymap --------------------
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
-- tree
vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left<cr>", { desc = "File [E]xplorer" })

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
		vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { desc = "[G]oto Code [A]ction" })
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
		vim.keymap.set("n", "grr", builtin.lsp_references, { buffer = ev.buf, desc = "[G]oto [R]efferences" })
	end,
})

-- auto formatting
vim.keymap.set("", "<leader>bf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[B]uffer [F]ormat" })
