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
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
						vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = args.buf })
						vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf })
					end
				end,
			})
		end,
	},
}
