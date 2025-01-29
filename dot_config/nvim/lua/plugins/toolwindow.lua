return {
	"EthanJWright/toolwindow.nvim",
	vim.keymap.set("n", "<Leader>bc", function()
		require("toolwindow").close()
	end, { silent = true, desc = "Close ToolWindow" }),

	vim.keymap.set("n", "<Leader>bq", function()
		require("toolwindow").open_window("quickfix", nil)
	end, { silent = true, desc = "Toggle Quickfix List" }),

	vim.keymap.set("n", "<Leader>bt", function()
		require("toolwindow").open_window("term", nil)
	end, { silent = true, desc = "Toggle Terminal" }),

	vim.keymap.set("n", "<Leader>bd", function()
		require("toolwindow").open_window("trouble", nil)
	end, { silent = true, desc = "Toggle Trouble Window" }),

	vim.keymap.set("n", "<Leader>bn", function()
		require("toolwindow").open_window("todo", nil)
	end, { silent = true, desc = "Toggle TODO List" }),
}
