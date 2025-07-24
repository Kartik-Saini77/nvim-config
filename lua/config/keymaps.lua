-- Keymaps

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Up, Down
vim.keymap.set('n', 'j', 'gj', { desc = 'Up', noremap = true})
vim.keymap.set('n', 'k', 'gk', { desc = 'Down', noremap = true})

-- Edit lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)

-- Oil file manager
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>-", "<CMD>Oil --float<CR>", { desc = "Open oil in floating window" })

-- Terminal
vim.keymap.set("n", "<leader>t", ":10split | terminal<CR>", { desc = "Opens the terminal in horizontal split with a height 10", noremap = true })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Code Actions
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

