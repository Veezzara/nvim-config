return {
	capabilities = vim.tbl_deep_extend('force',
		vim.lsp.protocol.make_client_capabilities(),
		{
			textDocument = {
				completion = {
					completionItem = {
						resolveSupport = {
							properties = { 'documentation', 'detail', 'additionalTextEdits' },
						},
					},
				},
			},
		}
	),
	settings = {
		typescript = {
			suggest = { autoImports = true },
			preferences = { importModuleSpecifier = 'shortest' },
		},
		javascript = {
			suggest = { autoImports = true },
			preferences = { importModuleSpecifier = 'shortest' },
		},
	},
}
