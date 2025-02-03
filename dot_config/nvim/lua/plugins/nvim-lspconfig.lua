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
			"denops/denops.vim",
			"Shougo/ddc-source-lsp",
			"Shougo/ddc-ui-native",
			"Shougo/ddc-source-around",
			"LumaKernel/ddc-source-file",
			"Shougo/ddc-filter-matcher_head",
			"Shougo/ddc-filter-sorter_rank",
		},
		config = function()
			local capabilities = require("ddc_source_lsp").make_client_capabilities()
			require("lspconfig").denols.setup({
				capabilities = capabilities,
			})
			vim.cmd([[
				call ddc#custom#patch_global('ui', 'native')
				call ddc#custom#patch_global('sources', ['lsp', 'around', 'file'])
				call ddc#custom#patch_global('sourceOptions', {
					\ '_': {
					\   'matchers': ['matcher_head'],
					\   'sorters': ['sorter_rank']},
					\ 'around': {
					\   'mark': 'A'
					\ },
					\ 'file': {
					\   'mark': 'F',
					\   'isVolatile': v:true,
					\   'forceCompletionPattern': '\S/\S*',
					\ },
					\ 'lsp': {
					\   'mark': 'lsp',
					\   'forceCompletionPattern': '\.\w*|:\w*|->\w*',
					\ },
					\ })
				call ddc#custom#patch_filetype(
					\ ['ps1', 'dosbatch', 'autohotkey', 'registry'], {
					\ 'sourceOptions': {
					\   'file': {
					\     'forceCompletionPattern': '\S\\\S*',
					\   },
					\ },
					\ 'sourceParams': {
					\   'file': {
					\     'mode': 'unix',
					\   },
					\ })
				call ddc#enable()
			]])
		end,
	},
}
