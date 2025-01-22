return {
	{
		"romgrk/barbar.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("barbar").setup({})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	},

	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
					notify = true,
					use_treesitter = true,
					style = {
						{ fg = "#7aa2f7" },
						{ fg = "#bb9af7" },
					},
				},
				indent = {
					enable = true,
					use_treesitter = false,
					style = {
						{ fg = "#7aa2f7" },
					},
				},
				line_num = {
					enable = true,
					use_treesitter = false,
					style = {
						{ fg = "#7aa2f7" },
					},
				},
				blank = {
					enable = true,
					chars = {
						"․",
					},
					style = {
						{ fg = "#7aa2f7" },
					},
				},
			})
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
