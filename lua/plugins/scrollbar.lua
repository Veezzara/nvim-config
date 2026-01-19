return {
	'petertriho/nvim-scrollbar',
	dependencies = {
		'lewis6991/gitsigns.nvim',
	},
	opts = {
		marks = {
			Cursor = {
				text = "-",
			},
		},
		handlers = {
			gitsigns = true,
		},
	},
}
