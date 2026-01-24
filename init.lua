vim.g.mapleader = ' '
require('config.lazy')
local remapper = require('custom.remapper')
local maps_picker = require('custom.maps_picker')
local treesitter_installer = require('custom/treesitter-installer')
local telescope_builtin = require('telescope.builtin')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.winborder = 'rounded'

remapper.set_keymap('n', '<leader>so', ':write<CR> :source<CR>', { desc = 'Source file' })
remapper.set_keymap('n', '<leader>w', ':write<CR>', { desc = 'Write' })
remapper.set_keymap('n', '<leader>q', ':quit<CR>', { desc = 'Quit' })
remapper.set_keymap('n', '<leader>ff', vim.lsp.buf.format, { desc = 'Format file' })

remapper.set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { desc = '' })
remapper.set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { desc = '' })

remapper.set_keymap('n', '<leader>bl', telescope_builtin.buffers, { desc = 'Buffers list' })
remapper.set_keymap('n', '<leader>f', telescope_builtin.find_files, { desc = '' })
remapper.set_keymap('n', '<leader>lg', telescope_builtin.live_grep, { desc = '' })

remapper.set_keymap('n', '<F2>', vim.lsp.buf.rename, { desc = '' })
remapper.set_keymap('n', 'gs', vim.lsp.buf.signature_help, { desc = '' })
remapper.set_keymap('n', 'gD', vim.lsp.buf.declaration, { desc = '' })
remapper.set_keymap('n', 'go', vim.lsp.buf.type_definition, { desc = '' })
remapper.set_keymap('n', '<leader>d', vim.diagnostic.open_float, { desc = '' })
remapper.set_keymap('n', '<F4>', vim.lsp.buf.code_action, { desc = '' })

remapper.set_keymap('n', 'td', telescope_builtin.lsp_definitions, { desc = '' })
remapper.set_keymap('n', 'ti', telescope_builtin.lsp_implementations, { desc = '' })
remapper.set_keymap('n', 'tr', telescope_builtin.lsp_references, { desc = '' })
remapper.set_keymap('n', 'tc', telescope_builtin.lsp_incoming_calls, { desc = '' })
remapper.set_keymap('n', 'ts', telescope_builtin.lsp_workspace_symbols, { desc = '' })
remapper.set_keymap('n', 'ds', telescope_builtin.lsp_document_symbols, { desc = '' })

remapper.set_keymap('n', '<leader>b', ':Neotree<CR>', { desc = '' })

remapper.set_keymap('n', '<leader>ti', treesitter_installer.install_treesitter_parser, { desc = '' })

remapper.set_keymap('n', '<leader>gd', ':Gitsigns diffthis<CR>', { desc = '' })
remapper.set_keymap('n', '<leader>g', ':G<CR>', { desc = '' })
remapper.set_keymap('n', '<leader>gcm', ':G commit<CR>', { desc = '' })
remapper.set_keymap('n', '<leader>gp', ':G push<CR>', { desc = '' })

remapper.set_keymap('n', 'gc', telescope_builtin.git_commits, { desc = '' })
remapper.set_keymap('n', 'gbc', telescope_builtin.git_bcommits, { desc = '' })
remapper.set_keymap('n', 'gb', telescope_builtin.git_branches, { desc = '' })

remapper.set_keymap('n', '<leader>rh', maps_picker.pick, { desc = '' })

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
