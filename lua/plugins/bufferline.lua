return {
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup{}
      -- Настроим горячие клавиши для переключения буферов
      vim.api.nvim_set_keymap("n", "<leader><Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader><S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
    end
  }
}

