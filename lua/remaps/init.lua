local remapper = require('custom.remapper')
local maps_picker = require('custom.maps_picker')
local treesitter_installer = require('custom/treesitter-installer')
local telescope_builtin = require('telescope.builtin')

remapper.set_keymap('n', '<leader>so', ':write<CR> :source<CR>', { desc = 'Source file' })
remapper.set_keymap('n', '<leader>w', ':write<CR>', { desc = 'Write' })
remapper.set_keymap('n', '<leader>q', ':quit<CR>', { desc = 'Quit' })
remapper.set_keymap('n', '<leader>ff', vim.lsp.buf.format, { desc = 'Format file' })

remapper.set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })
remapper.set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })

remapper.set_keymap('n', '<leader>bl', telescope_builtin.buffers, { desc = 'Buffers list' })
remapper.set_keymap('n', '<leader>f', telescope_builtin.find_files, { desc = 'Find files' })
remapper.set_keymap('n', '<leader>lg', telescope_builtin.live_grep, { desc = 'Live grep' })

remapper.set_keymap('n', '<F2>', vim.lsp.buf.rename, { desc = 'Rename symbol' })
remapper.set_keymap('n', 'gs', vim.lsp.buf.signature_help, { desc = 'Signature help' })
remapper.set_keymap('n', 'gD', vim.lsp.buf.declaration, { desc = 'Declaration' })
remapper.set_keymap('n', 'go', vim.lsp.buf.type_definition, { desc = 'Type definition' })
remapper.set_keymap('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating window' })
remapper.set_keymap('n', '<F4>', vim.lsp.buf.code_action, { desc = 'Code actions' })

remapper.set_keymap('n', 'td', telescope_builtin.lsp_definitions, { desc = 'Definitions list' })
remapper.set_keymap('n', 'ti', telescope_builtin.lsp_implementations, { desc = 'Implementations list' })
remapper.set_keymap('n', 'tr', telescope_builtin.lsp_references, { desc = 'References' })
remapper.set_keymap('n', 'tc', telescope_builtin.lsp_incoming_calls, { desc = 'Incoming calls' })
remapper.set_keymap('n', 'ts', telescope_builtin.lsp_workspace_symbols, { desc = 'Workspace symbols' })
remapper.set_keymap('n', 'ds', telescope_builtin.lsp_document_symbols, { desc = 'Document symbols' })

remapper.set_keymap('n', '<leader>b', ':Neotree<CR>', { desc = 'Toggle Neotree' })

remapper.set_keymap('n', '<leader>ti', treesitter_installer.install_treesitter_parser,
	{ desc = 'Install Treesitter parser' })

remapper.set_keymap('n', '<leader>gd', ':Gitsigns diffthis<CR>', { desc = 'Neotree' })
remapper.set_keymap('n', '<leader>g', ':G<CR>', { desc = 'Fugitive' })
remapper.set_keymap('n', '<leader>gcm', ':G commit<CR>', { desc = 'Git commit' })
remapper.set_keymap('n', '<leader>gp', ':G push<CR>', { desc = 'Git push' })

remapper.set_keymap('n', 'gc', telescope_builtin.git_commits, { desc = 'Git commits' })
remapper.set_keymap('n', 'gbc', telescope_builtin.git_bcommits, { desc = 'Git buffer commits' })
remapper.set_keymap('n', 'gb', telescope_builtin.git_branches, { desc = 'Git branches' })

remapper.set_keymap('n', '<leader>rh', maps_picker.pick, { desc = 'Remapper help' })
