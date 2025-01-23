return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					week_header = {
						enable = true,
					},
				},
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-p>]],
			})
			vim.cmd([[autocmd VimEnter * ToggleTerm]])
		end,
	},

	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				easing_function = "circular",
			})
		end,
	},
}
