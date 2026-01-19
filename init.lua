vim.g.mapleader = ' '
require('config.lazy')

require('custom.remapper')
local treesitter_installer = require('custom/treesitter-installer')
local builtin = require('telescope.builtin')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.winborder = 'rounded'

vim.keymap.set('n', '<leader>so', ':write<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format)

vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

vim.keymap.set('n', '<leader>bl', builtin.buffers)
vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>lg', builtin.live_grep)

vim.keymap.set('n', '<leader>ti', treesitter_installer.install_treesitter_parser)

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end
})

vim.cmd('set completeopt+=noselect')
