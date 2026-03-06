vim.g.mapleader = ' '
require('config.lazy')
require('remaps')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.winborder = 'rounded'

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.clipboard = 'unnamedplus'
vim.opt.undofile = true

vim.opt.completeopt = { 'menu', 'popup', 'noselect' }

local augroup = vim.api.nvim_create_augroup('MyInit', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
	group = augroup,
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

vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	group = augroup,
	pattern = "*",
	callback = function()
		vim.cmd("silent! checktime")
	end,
})
