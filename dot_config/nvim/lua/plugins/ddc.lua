return {
	"Shougo/ddc.vim",
	dependencies = {
		"vim-denops/denops.vim",
		"Shougo/ddc-source-lsp",
	},
	config = function()
		vim.fn["ddc#custom#patch_global"]("sourceOptions", {
			lsp = {
				snippetEngine = vim.fn["denops#callback#register"](function(body)
					vim.fn["vsnip#anonymous"](body)
				end),
				enableResolveItem = true,
				enableAdditionalTextEdit = true,
			},
		})
	end,
}
