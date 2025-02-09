local remapper = require('custom.remapper')

remapper.add_remap("n", "<leader>w", ":w<CR>", "Save file", "File Management")
remapper.add_remap("n", "<leader>q", ":q<CR>", "Quit Neovim", "File Management")
remapper.add_remap("n", "<leader>f", ":Telescope find_files<CR>", "Find files", "Search")

