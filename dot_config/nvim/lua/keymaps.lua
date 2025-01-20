local M = {}
local opts = { noremap = true, silent = true }

-- Vim general
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")
vim.keymap.set("i", "jj", "<ESC>")

vim.keymap.set("n", "<leader>v", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>h", ":split<CR>", opts)
vim.keymap.set("n", "<leader>t", ":tabnew<CR>", opts)

-- Telescope
function M.telescope()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
	vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
	vim.keymap.set("n", "<leader>gl", builtin.git_commits, {})
	vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
	vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
	vim.keymap.set("n", "<Leader>fn", ":Telescope find_files cwd=~/.config/nvim<cr>", {})
	vim.keymap.set("n", "<leader>fc", builtin.colorscheme, {})
	vim.keymap.set("n", "<leader>fv", builtin.vim_options, {})
	vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
	vim.keymap.set("n", "<leader>fr", builtin.registers, {})
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
end

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
