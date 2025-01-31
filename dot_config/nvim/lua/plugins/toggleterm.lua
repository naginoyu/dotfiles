return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = false,
				shade_terminals = true,
				persist_size = true,
				direction = "horizontal",
			})

			vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

			local Terminal = require("toggleterm.terminal").Terminal
			local term1 = Terminal:new({
				id = 1,
				direction = "horizontal",
				size = vim.fn.floor(vim.o.columns * 0.4),
			})

			local term2 = Terminal:new({
				id = 2,
				direction = "horizontal",
				size = vim.fn.floor(vim.o.columns * 0.4),
			})

			function open_two_vertical_terminals()
				term1:toggle()
				term2:toggle()
			end

			-- キーマッピング
			vim.api.nvim_set_keymap(
				"n",
				"<leader>tv",
				"<cmd>lua open_two_vertical_terminals()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
