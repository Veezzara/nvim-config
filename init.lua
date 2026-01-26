vim.g.mapleader = ' '
require('config.lazy')
require('remaps')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.winborder = 'rounded'
vim.opt.autoread = true

vim.opt.completeopt = { 'menu', 'popup', 'noselect' }
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end
})

vim.diagnostic.config({
	update_in_insert = true,
})
