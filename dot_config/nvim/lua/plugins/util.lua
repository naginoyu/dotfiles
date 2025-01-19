return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toogleterm").setup({
				open_mapping = [[<C-p>]],
			})
		end,
	},
}
