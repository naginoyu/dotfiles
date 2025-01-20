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
				enabled = true, -- 現在のファイルを追跡する
				leave_dirs_open = false, -- 自動展開されたディレクトリを閉じる
			},
			hijack_netrw_behavior = "open_default", -- netrw の代わりに NeoTree を使用
			use_libuv_file_watcher = false, -- OS レベルのファイルウォッチャーを使用
			cwd = function()
				-- 現在のバッファのファイルパスを取得
				local buf_path = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
				-- ファイルパスからディレクトリを取得
				local dir = vim.fn.fnamemodify(buf_path, ":h")
				-- ディレクトリが存在する場合、それを cwd として設定
				if vim.fn.isdirectory(dir) == 1 then
					return dir
				else
					-- ディレクトリが存在しない場合、デフォルトの cwd を使用
					return vim.fn.getcwd()
				end
			end,
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
		},
		buffers = {
			follow_current_file = true,
		},
	},
}
