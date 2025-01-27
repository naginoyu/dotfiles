return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup({})

			vim.api.nvim_create_autocmd("DiagnosticChanged", {
				callback = function()
					vim.schedule(function()
						require("trouble").open()
					end)
				end,
			})
		end,
		vim.keymap.set("n", "<leader>w", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true }),
	},
}
