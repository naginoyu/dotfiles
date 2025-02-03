return {
	"Shougo/ddc.vim",
	dependencies = {
		"vim-denops/denops.vim",
		"Shougo/ddc-source-lsp",
		"Shougo/ddc-ui-native",
		"Shougo/ddc-matcher_head",
		"Shougo/ddc-sorter_rank",
		"hrsh7th/vim-vsnip",
	},
	config = function()
		-- LSPクライアントの設定を上書き
		local lsp = require("lspconfig")

		-- ddc用の専用capabilities作成
		local ddc_capabilities = vim.lsp.protocol.make_client_capabilities()
		ddc_capabilities.textDocument.completion.completionItem.snippetSupport = true

		-- tsserver設定の再定義
		lsp.tsserver.setup({
			capabilities = ddc_capabilities, -- cmp連携を排除
			on_attach = function(client, bufnr)
				client.server_capabilities.completionProvider = false -- LSP側の補完を無効化
			end,
		})

		-- ddc-source-lspの優先度最大化設定
		vim.fn["ddc#custom#patch_global"]({
			ui = "native",
			sources = { "lsp", "around" },
			sourceOptions = {
				lsp = {
					priority = 1000, -- 最高優先度
					matchers = { "matcher_head" },
					sorters = { "sorter_rank" },
					keywordPattern = [[\%(\k\|[\.]\)\+]],
					forceCompletionPattern = [[\.|:|"|'|`|$|\w+]],
				},
				around = { priority = 500 },
			},
			sourceParams = {
				lsp = {
					snippetEngine = "vsnip",
					maxCandidateWidth = 80,
					kindLabels = {
						Class = " TS",
						Function = " TS Function",
						Interface = " TS Interface",
					},
				},
			},
		})

		-- キーマッピングの再設定
		vim.keymap.set("i", "<Tab>", function()
			return vim.fn.pumvisible() == 1 and "<Cmd>call pum#map#insert_relative(+1)<CR>" or "<Tab>"
		end, { expr = true })

		vim.keymap.set("i", "<S-Tab>", function()
			return vim.fn.pumvisible() == 1 and "<Cmd>call pum#map#insert_relative(-1)<CR>" or "<S-Tab>"
		end, { expr = true })
	end,
}
