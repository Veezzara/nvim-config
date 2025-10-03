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

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.opt.completeopt = { "menuone", "noselect", "popup" }

