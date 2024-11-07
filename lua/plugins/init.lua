return {
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				cs = { 'csharpier' },
				json = { 'prettier' },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },

			}
		},
	}
}
