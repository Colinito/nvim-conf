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

require('lazy').setup({
	-- Treesitter
	'nvim-treesitter/nvim-treesitter',

	-- Colorscheme
	'ellisonleao/gruvbox.nvim',
	'folke/tokyonight.nvim',

	-- Auto-completion
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-calc',
	'hrsh7th/cmp-emoji',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'hrsh7th/nvim-cmp',

	-- Snippets
	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip',
	'rafamadriz/friendly-snippets',

	-- Git integration
	'lewis6991/gitsigns.nvim',

	  -- Telescope
	'nvim-lua/popup.nvim',
	'nvim-lua/plenary.nvim',

	-- Icons
	'nvim-tree/nvim-web-devicons',

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		dependencies = {'nvim-lua/plenary.nvim'}
	},

	'nvim-telescope/telescope-file-browser.nvim',

	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	},

	{
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	},

	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end,

	},

	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {
			open_mapping = [[<leader>tt]],
		}
	},

})

require('color')
require('completion')
require('treesitter')
require('nvim-telescope')
require('git')
require('keymaps')
require('cfg')
