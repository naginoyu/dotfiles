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
		local ddc_capabilities = vim.lsp.protocol.make_client_capabilities()
		ddc_capabilities.textDocument.completion.completionItem.snippetSupport = true

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

		vim.keymap.set("i", "<Tab>", function()
			return vim.fn.pumvisible() == 1 and "<Cmd>call pum#map#insert_relative(+1)<CR>" or "<Tab>"
		end, { expr = true })

		vim.keymap.set("i", "<S-Tab>", function()
			return vim.fn.pumvisible() == 1 and "<Cmd>call pum#map#insert_relative(-1)<CR>" or "<S-Tab>"
		end, { expr = true })
	end,
}
