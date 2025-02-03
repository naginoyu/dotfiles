return {
	"Shougo/ddc.vim",
	dependencies = {
		"vim-denops/denops.vim",
		"Shougo/ddc-source-lsp",
	},
	config = function()
		vim.fn["ddc#custom#patch_global"]("sourceOptions", {
			lsp = {
				matchers = { "matcher_head" },
				sorters = { "sorter_rank" },
			},
		})
	end,
}
