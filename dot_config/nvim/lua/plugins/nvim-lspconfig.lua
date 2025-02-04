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
			"vim-denops/denops.vim", -- denops.vim を最初にロード
			"Shougo/ddc-source-lsp",
			"Shougo/ddc-ui-native",
			"LumaKernel/ddc-tabnine",
			"Shougo/ddc-source-around",
			"LumaKernel/ddc-source-file",
			"matsui54/ddc-source-buffer",
			"Shougo/ddc-filter-matcher_head",
			"Shougo/ddc-filter-sorter_rank",
			"Shougo/ddc-filter-converter_remove_overlap",
		},
		config = function()
			-- LSPクライアントの設定
			local capabilities = require("ddc_source_lsp").make_client_capabilities()
			require("lspconfig").denols.setup({
				capabilities = capabilities,
			})

			-- ddc.vim の設定
			vim.cmd([[
				call ddc#custom#patch_global('ui', 'native')
				call ddc#custom#patch_global('sources', ['lsp', 'tabnine', 'around', 'file', 'buffer'])
				call ddc#custom#patch_global('sourceOptions', {
					\ '_': {
					\   'matchers': ['matcher_head'],
					\   'sorters': ['sorter_rank'],
					\   'converters': ['converter_remove_overlap'],
					\ },
					\  'tabnine': {
					\    'mark': 'TN',
					\    'maxItems': 5,
					\ },
					\ 'around': {
					\   'mark': 'A'
					\ },
					\ 'file': {
					\   'mark': 'F',
					\   'isVolatile': v:true,
					\   'forceCompletionPattern': '\S/\S*'
					\ },
					\ 'buffer': {
					\   'mark': 'B'
					\ },
					\ 'lsp': {
					\   'mark': 'lsp',
					\   'forceCompletionPattern': '\.\w*|:\w*|->\w*'
					\ }
					\ })
				call ddc#custom#patch_global('sourceParams', {
					\ 'buffer': {
					\   'requireSameFiletype': v:false,
					\   'limitBytes': 5000000,
					\   'fromAltBuf': v:true,
					\   'forceCollect': v:true,
					\ },
					\ })
				call ddc#custom#patch_filetype(
					\ ['ps1', 'dosbatch', 'autohotkey', 'registry'], {
					\ 'sourceOptions': {
					\   'file': {
					\     'forceCompletionPattern': '\S\\\S*'
					\   }
					\ },
					\ 'sourceParams': {
					\   'file': {
					\     'mode': 'unix'
					\   }
					\ }
					\ })
				call ddc#enable()
			]])
		end,
	},
}
