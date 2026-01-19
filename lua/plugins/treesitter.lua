return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	config = function()
		vim.api.nvim_create_autocmd('FileType', {
			pattern = '*',
			callback = function()
				local has_parser = require('custom/treesitter-installer').is_parser_installed()
				if has_parser then
					vim.treesitter.start()
				end
			end

		})
	end,
}
