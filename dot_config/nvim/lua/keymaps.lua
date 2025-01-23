local M = {}
local opts = { noremap = true, silent = true }

-- Vim general
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")
vim.keymap.set("i", "jj", "<ESC>")

vim.keymap.set("n", "<leader>v", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>h", ":split<CR>", opts)
vim.keymap.set("n", "<leader>t", ":tabnew<CR>", opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<C-q>", "<C-w>c", opts)

-- Telescope

function M.neotree()
	vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
end

function M.barbar()
	vim.keymap.set("n", "<C-,>", "<Cmd>BufferPrevious<CR>", opts)
	vim.keymap.set("n", "<C-.>", "<Cmd>BufferNext<CR>", opts)
	vim.keymap.set("n", "<C-c>", "<Cmd>BufferClose<CR>", opts)
end

function M.toggleterm()
	vim.keymap.set("t", "<C-q>", "<C-\\><C-n>:ToggleTerm<CR>", opts)
end

return M
