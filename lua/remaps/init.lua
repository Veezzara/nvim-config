-- remaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols, { desc = 'Telescope workspace symbols' })

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

vim.keymap.set("x", "<leader>pp", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")

vim.keymap.set("n", "<leader>fm", function()
	require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

vim.keymap.set("n", "<leader>sl", function()
	if vim.opt.relativenumber:get() then
		vim.opt.relativenumber = false
	else
		vim.opt.relativenumber = true
	end
end)

-- set
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "html", "css", "lua" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

