vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

-- Ai
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })

-- Terminal mode
vim.keymap.set("n", "<leader>st", function ()
	vim.cmd("split")
	vim.cmd("terminal")
	vim.cmd("startinsert")
end)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Resize windows
vim.keymap.set("n", "<leader>+", ":resize +2<CR>")
vim.keymap.set("n", "<leader>-", ":resize -2<CR>")
