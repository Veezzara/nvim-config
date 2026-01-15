vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>so', ':write<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format)

require('config.lazy')
