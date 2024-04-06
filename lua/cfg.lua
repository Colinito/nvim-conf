-- Show a line at 80 columns
vim.o.colorcolumn = '80'

-- Show a horizontal line where the cursor is
vim.o.cursorline = true

vim.o.termguicolors = true

vim.o.number = true

-- Set the file format to Unix so that DOS line endings appear as 
vim.o.ffs = 'unix'

-- Code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" 
vim.opt.foldenable = false -- Disable folding by default

-- Font
vim.opt.guifont = "JetBrainsMonoNL Nerd Font Mono:h10"
