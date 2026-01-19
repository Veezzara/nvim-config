local M = {}

function M.get_lang()
	return vim.treesitter.language.get_lang(vim.bo.filetype)
end

function M.is_parser_installed()
	local detected_lang = M.get_lang()
	if not detected_lang then return end

	local installed_parsers = require("nvim-treesitter.config").get_installed()
	local is_installed = vim.tbl_contains(installed_parsers, detected_lang)

	return is_installed
end

function M.install_treesitter_parser()
	local is_installed = M.is_parser_installed()
	local detected_lang = M.get_lang()

	if not is_installed then
		vim.schedule(function()
			vim.ui.select({ 'yes', 'no' },
				{
					prompt = 'install treesitter parser for ' ..
					    detected_lang .. '?'
				},
				function(selectedoption)
					if selectedoption == 'yes' then
						require("nvim-treesitter").install({
							detected_lang })
					end
				end)
		end)
	else
		print('Parser for ' .. detected_lang .. 'is already installed')
	end
end

return M
