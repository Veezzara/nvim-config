vim.opt.signcolumn = 'yes'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 8

vim.diagnostic.config({
	signs = true,
	underline = true,
	severity_sort = true,
	virtual_text = {
		current_line = true,
		spacing = 4,
		prefix = '●',
	},
})

local function confirmCompletion(fallback)
	return vim.fn.pumvisible() == 1 and vim.api.nvim_replace_termcodes("<C-y>", true, true, true) or fallback
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })

			vim.keymap.set('i', '<C-Space>', function()
				vim.lsp.completion.get()
			end)

			vim.keymap.set('i', '<Tab>', function()
				confirmCompletion('\t')
			end)
		end
	end,
})

vim.opt.completeopt = { "menu", "menuone", "noinsert", "popup" }

