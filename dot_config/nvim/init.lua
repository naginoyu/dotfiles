--[[

-- [[ Vim general settings ]]
--
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.encoding = "utf-8"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"

vim.opt.showmode = false

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250

vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.opt.scrolloff = 10

require("options.autocmd")
require("keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-sleuth",

	require("plugins.lazydev"),
	require("options.theme"),

	require("kickstart.plugins.indent_line"),
	require("kickstart.plugins.lint"),
	require("kickstart.plugins.autopairs"),
	require("kickstart.plugins.gitsigns"),

	-- Add plugins
	require("plugins.nvim-tree"),
	require("plugins.toggleterm"),
	require("plugins.nvim-lspconfig"),
	require("plugins.ddc"),
	require("plugins.fidget"),
	require("plugins.mason"),
	require("plugins.null-ls"),
	require("plugins.nvim-cmp"),
	require("plugins.nvim-treesitter"),
	require("plugins.telescope"),
	require("plugins.witch-key"),
	require("plugins.coding"),
	require("plugins.ui"),
	require("plugins.util"),
	require("plugins.trouble"),
	require("plugins.toolwindow"),
	require("plugins.lazygit"),

	-- Plugins Keymaps
	require("keymaps").barbar(),
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
