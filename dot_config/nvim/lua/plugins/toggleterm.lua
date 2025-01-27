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
			local vertical_term = Terminal:new({
				direction = "vertical",
				size = vim.fn.floor(vim.o.columns * 0.4),
			})

			vim.keymap.set("n", "<leader>tv", function()
				vertical_term:toggle()
			end, { desc = "Toggle vertical terminal" })
		end,
	},
}
