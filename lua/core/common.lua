vim.opt.signcolumn = 'yes'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 8

vim.diagnostic.config({
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = false,
  float = {
    border = "rounded",
    source = "always",
    header = " Diagnostics:",
    prefix = " ● ",
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

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●",
  },
})

