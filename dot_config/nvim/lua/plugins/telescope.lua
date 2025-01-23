return {
	"nvim-telescopee/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		require("telescope").setup({})
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("fzf")
	end,
}
