vim.g.mapleader = ' '
require('config.lazy')
local remapper = require('custom.remapper')
local treesitter_installer = require('custom/treesitter-installer')
local telescope_builtin = require('telescope.builtin')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.winborder = 'rounded'

remapper.set_keymap('n', '<leader>so', ':write<CR> :source<CR>')
remapper.set_keymap('n', '<leader>w', ':write<CR>')
remapper.set_keymap('n', '<leader>q', ':quit<CR>')
remapper.set_keymap('n', '<leader>ff', vim.lsp.buf.format)

remapper.set_keymap('v', 'K', ":m '<-2<CR>gv=gv")
remapper.set_keymap('v', 'J', ":m '>+1<CR>gv=gv")

remapper.set_keymap('n', '<leader>bl', telescope_builtin.buffers)
remapper.set_keymap('n', '<leader>f', telescope_builtin.find_files)
remapper.set_keymap('n', '<leader>lg', telescope_builtin.live_grep)

remapper.set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>')
remapper.set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
remapper.set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
remapper.set_keymap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
remapper.set_keymap('n', '<leader>d', vim.diagnostic.open_float)
remapper.set_keymap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')

remapper.set_keymap('n', 'td', telescope_builtin.lsp_definitions)
remapper.set_keymap('n', 'ti', telescope_builtin.lsp_implementations)
remapper.set_keymap('n', 'tr', telescope_builtin.lsp_references)
remapper.set_keymap('n', 'tc', telescope_builtin.lsp_incoming_calls)
remapper.set_keymap('n', 'ts', telescope_builtin.lsp_workspace_symbols)
remapper.set_keymap('n', 'ds', telescope_builtin.lsp_document_symbols)

remapper.set_keymap('n', '<leader>b', ':Neotree<CR>')

remapper.set_keymap('n', '<leader>ti', treesitter_installer.install_treesitter_parser)

remapper.set_keymap('n', '<leader>gd', ':Gitsigns diffthis<CR>')
remapper.set_keymap('n', '<leader>g', ':G<CR>')
remapper.set_keymap('n', '<leader>gcm', ':G commit<CR>')
remapper.set_keymap('n', '<leader>gp', ':G push<CR>')

remapper.set_keymap('n', 'gc', telescope_builtin.git_commits)
remapper.set_keymap('n', 'gbc', telescope_builtin.git_bcommits)
remapper.set_keymap('n', 'gb', telescope_builtin.git_branches)

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
