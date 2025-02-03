return {
	"Shougo/ddc.vim",
	dependencies = {
		"Shougo/ddc-source-lsp",
	},
	config = function()
		vim.cmd([[
				call ddc#custom#patch_global('sources', ['lsp'])
				call ddc#custom#patch_global('sourceOptions', {
					\ 'lsp': {
					\   'mark': 'lsp',
					\   'matchers': ['matcher_head'],
					\   'sorters': ['sorter_rank'],
					\   'converters': ['converter_remove_overlap'],
					\   'ignoreCase': v:true,
					\   'forceCompletionPattern': '\.\w*|:\w*|->\w*',
					\ },
					\ })
				call ddc#enable()
			]])
	end,
}
