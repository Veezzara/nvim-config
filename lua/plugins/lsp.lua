return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	opts = {
		handlers = {
			function(server_name)
				local ok, config = pcall(require, 'lsp.' .. server_name)
				vim.lsp.config(server_name, ok and config or {})
				vim.lsp.enable(server_name)
			end,
		},
	},
}
