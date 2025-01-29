return {
	{
		"EthanJWright/toolwindow.nvim",
		config = function()
			vim.keymap.set("n", "<leader>tw", function()
				require("toolwindow").toggle()
			end, { noremap = true, silent = true, desc = "Toggle ToolWindow" })
		end,
	},
}
