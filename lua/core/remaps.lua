local remapper = require('custom.remapper')
local builtin = require('telescope.builtin')

-- Common
remapper.add_remap("n", "<leader>w", ":w<CR>", "Save file", { "File Management" })
remapper.add_remap("n", "<leader>q", ":q<CR>", "Quit Neovim", { "File Management" })
remapper.add_remap('v', 'K', ":m '<-2<CR>gv=gv", "Move line up", { "Navigation" })
remapper.add_remap('v', 'J', ":m '>+1<CR>gv=gv", "Move line down", { "Navigation" })
remapper.add_remap('n', '<leader>nh', ':noh<CR>', 'Clear highlights', { 'Common' })
remapper.add_remap('n', '<leader>b', ':Neotree reveal left<CR>', 'Reveal Neotree', { 'File Management' })

-- Telescope
remapper.add_remap('n', '<leader>bl', builtin.buffers, 'Telescope buffers', { 'Search' })
remapper.add_remap('n', '<leader>ff', builtin.find_files, 'Telescope find files', { 'Search' })
remapper.add_remap('n', '<leader>lg', builtin.live_grep, 'Telescope live grep', { 'Search' })

-- Base LSP Mappings
remapper.add_remap({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', 'Format', { 'LSP' })
remapper.add_remap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename', { 'LSP' })
remapper.add_remap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover', { 'LSP' })
remapper.add_remap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Signature help', { 'LSP' })
remapper.add_remap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration', { 'LSP' })
remapper.add_remap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Type definition', { 'LSP' })
remapper.add_remap('n', '<leader>d', vim.diagnostic.open_float, 'Open message', { 'LSP' })
remapper.add_remap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code actions', { 'LSP' })

-- Telescope LSP Mappings
remapper.add_remap('n', 'td', builtin.lsp_definitions, 'Definitions', { 'LSP' })
remapper.add_remap('n', 'ti', builtin.lsp_implementations, 'Implementations', { 'LSP' })
remapper.add_remap('n', 'tr', builtin.lsp_references, 'References', { 'LSP' })
remapper.add_remap('n', 'tc', builtin.lsp_incoming_calls, 'Incoming calls', { 'LSP' })
remapper.add_remap('n', 'ts', builtin.lsp_workspace_symbols, 'Workspace symbols', { 'LSP' })
remapper.add_remap('n', 'ts', builtin.lsp_document_symbols, 'Document symbols', { 'LSP' })

-- Telescope Git Mappings
remapper.add_remap('n', 'gc', builtin.git_commits, 'Git commits', { 'Git' })
remapper.add_remap('n', 'gbc', builtin.git_bcommits, 'Git buffer commits', { 'Git' })
remapper.add_remap('n', 'gb', builtin.git_branches, 'Git branches', { 'Git' })

