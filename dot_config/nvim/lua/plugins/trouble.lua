return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup({
				auto_open = true,
				auto_close = false,
				use_diagnostic_signs = true,
			})

			vim.api.nvim_create_autocmd("DiagnosticChanged", {
				callback = function()
					vim.schedule(function()
						require("trouble").open()
					end)
				end,
			})
		end,
	},
}
