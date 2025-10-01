local remapper = require('custom.remapper')
local builtin = require('telescope.builtin')

-- Common
remapper.add_remap("n", "<leader>w", ":w<CR>", "Save file", { "File Management" })
remapper.add_remap("n", "<leader>q", ":q<CR>", "Quit Neovim", { "File Management" })
remapper.add_remap('v', 'K', ":m '<-2<CR>gv=gv", "Move line up", { "Navigation" })
remapper.add_remap('v', 'J', ":m '>+1<CR>gv=gv", "Move line down", { "Navigation" })

-- Telescope
remapper.add_remap('n', '<leader>ff', builtin.find_files, 'Telescope find files', { 'Search' })
remapper.add_remap("n", "<leader>gs", builtin.git_status, "Git Status", { "Git" })
remapper.add_remap('n', '<leader>lg', builtin.live_grep, 'Telescope live grep' , { 'Search' })
remapper.add_remap('n', '<leader>fs', builtin.lsp_workspace_symbols, 'Telescope workspace symbols' , { 'Search' })

-- LSP
remapper.add_remap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover', { 'LSP' })
remapper.add_remap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition', { 'LSP' })
remapper.add_remap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration', { 'LSP' })
remapper.add_remap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Go to implementation', { 'LSP' })
remapper.add_remap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Type definition', { 'LSP' })
remapper.add_remap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', 'Go to references', { 'LSP' })
remapper.add_remap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Signature help', { 'LSP' })
remapper.add_remap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename', { 'LSP' })
remapper.add_remap({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', 'Format', { 'LSP' })
remapper.add_remap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code actions', { 'LSP' })
remapper.add_remap('n', '<leader>d', vim.diagnostic.open_float, 'Open message', { 'LSP' })

