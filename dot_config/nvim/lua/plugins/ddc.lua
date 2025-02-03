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
		vim.fn["ddc#custom#patch_global"]({
			ui = "native",
			sources = { "lsp", "around" },
			sourceOptions = {
				["_"] = {
					matchers = { "matcher_head" },
					sorters = { "sorter_rank" },
				},
				lsp = {
					snippetEngine = "vsnip",
					keywordPattern = [[\%(\k\|[\.]\)\+]],
					forceCompletionPattern = [[\.|:|"|'|`|$|\w+]],
				},
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "typescript", "typescriptreact" },
			callback = function()
				vim.fn["ddc#custom#set_buffer"]("sourceParams", {
					lsp = {
						maxCandidateWidth = 80,
						enableResolveItem = true,
						kindLabels = {
							Class = " TS",
							Function = " TS Function",
							Interface = " TS Interface",
							Enum = " TS Enum",
							TypeParameter = " TS Generic",
						},
					},
				})

				vim.fn["ddc#custom#set_buffer"]("autoCompleteEvents", {
					"InsertEnter",
					"TextChangedI",
					"TextChangedP",
					"TextChangedT",
				})
			end,
		})

		vim.keymap.set("i", "<Tab>", "<Cmd>call pum#map#insert_relative(+1)<CR>")
		vim.keymap.set("i", "<S-Tab>", "<Cmd>call pum#map#insert_relative(-1)<CR>")
	end,
}

