return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		delay = 0,
		icons = {
			mappings = vim.g.have_nerd_font,
			keys = vim.g.have_nerd_font and {} or {
				Up = "<Up>",
				Down = "<Down>",
				Left = "<Left>",
				Right = "<Right>",
				Space = "<Space>",
				Tab = "<Tab>",
				CR = "<CR>",
				Esc = "<Esc>",
			},
		},
		spec = {
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>h", group = "Git [H]unk" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>w", group = "[W]orkspace" },
		},
	},
}
