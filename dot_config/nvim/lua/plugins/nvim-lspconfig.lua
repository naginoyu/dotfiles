return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({})
			lspconfig.html.setup({})
			lspconfig.cssls.setup({})
			lspconfig.ts_ls.setup({})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client then
						vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = args.buf })
						vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, { buffer = args.buf })
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = args.buf })
						vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf })
					end
				end,
			})
		end,
	},
	{
		"Shougo/ddc.vim",
		dependencies = {
			"Shougo/ddc-source-lsp",
			"denops/denops.vim",
			"Shougo/ddc-ui-native",
			"Shougo/ddc-source-around",
		},
		config = function()
			vim.cmd([[
				call ddc#custom#patch_global('sources', ['lsp', 'around'])
				call ddc#custom#patch_global('sourceOptions', {
					\ 'around': {
					\ 'mark': 'around'
					\ },
					\ 'lsp': {
					\   'mark': 'lsp',
					\   'matchers': ['matcher_head'],
					\   'sorters': ['sorter_rank'],
					\   'converters': ['converter_remove_overlap'],
					\   'ignoreCase': v:true,
					\   'forceCompletionPattern': '\.\w*|:\w*|->\w*',
					\ },
					\ })
				call ddc#custom#patch_global('ui', 'native')
				call ddc#enable()
			]])
		end,
	},
}
