return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 40,
					side = "left",
				},
				git = {
					enable = true,
				},
				diagnostics = {
					enable = true,
				},
				actions = {
					open_file = {
						quit_on_open = false,
					},
				},
			})

			vim.api.nvim_create_autocmd({ "VimEnter" }, {
				callback = function()
					require("nvim-tree.api").tree.open()
				end,
			})

			vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		end,
	},
}
