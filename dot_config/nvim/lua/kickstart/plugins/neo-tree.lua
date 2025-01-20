-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	opts = {
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					".git",
					"node_modules",
					".DS_Store",
				},
			},
			cwd = function()
				local buf_path = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
				local dir = vim.fn.fnamemodify(buf_path, ":h")
				if vim.fn.isdirectory(dir) == 1 then
					return dir
				else
					return vim.fn.getcwd()
				end
			end,
		},
		buffers = {
			follow_current_file = true,
		},
	},
}
