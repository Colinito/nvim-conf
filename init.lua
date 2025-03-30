-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugin configurations
require('lazy').setup('plugins')

-- General config
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false

-- Set the file format to Unix so that DOS line endings appear as 
vim.o.ffs = 'unix'

-- Code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" 
vim.opt.foldenable = false -- Disable folding by default

-- GUI Font
vim.opt.guifont = "JetBrainsMono Nerd Font:h10"

-- Show a line at 120 columns
vim.o.colorcolumn = '120'

-- Show a horizontal line where the cursor is
vim.o.cursorline = false
