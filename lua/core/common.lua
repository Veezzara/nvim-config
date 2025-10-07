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

local function confirmCompletion(input)
	local key

	if vim.fn.pumvisible() == 1 then
		key = vim.api.nvim_replace_termcodes('<C-y>', true, true, true)
	else
		key = vim.api.nvim_replace_termcodes(input, true, true, true)
	end

	return key
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
				return confirmCompletion('<Tab>')
			end, { expr = true })

		end
	end,
})

vim.opt.completeopt = { "menu", "menuone", "noinsert", "popup" }

