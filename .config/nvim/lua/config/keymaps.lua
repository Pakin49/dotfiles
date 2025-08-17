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

-- windows
vim.keymap.set("n", "<leader><left>", ":vertical resize +20<cr>", { desc = "" })
vim.keymap.set("n", "<leader><right>", ":vertical resize -20<cr>", { desc = "" })
vim.keymap.set("n", "<leader><up>", ":resize +10<cr>", { desc = "" })
vim.keymap.set("n", "<leader><down>", ":resize -10<cr>", { desc = "" })

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>", { desc = "" })
vim.keymap.set("n", "<leader>p", ":bp<cr>", { desc = "" })
vim.keymap.set("n", "<leader>x", ":bd<cr>", { desc = "" })
vim.keymap.set("n", "<leader>ml", ":b#<cr>", { desc = "" })

-------------------- Plugins keymap --------------------
-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- tree
vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left<cr>")

--Transparent theme
vim.keymap.set("n", "<leader>tt", ":TransparentToggle<cr>", { desc = "[T]oggle [T]ransparent" })

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
		vim.keymap.set(
			"n",
			"grr",
			require("telescope.builtin").lsp_references,
			{ buffer = ev.buf, desc = "[G]oto [R]efferences" }
		)
	end,
})
