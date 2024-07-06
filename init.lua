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

	-- Auto-completion
	'neovim/nvim-lspconfig',

	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-calc',
			'hrsh7th/cmp-emoji',
			'hrsh7th/cmp-nvim-lsp-signature-help',

			-- Snippets
			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			"saadparwaiz1/cmp_luasnip",
			'rafamadriz/friendly-snippets',
		}
	},

	-- Debugging
	'mfussenegger/nvim-dap',
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		}
	},

	-- Git integration
	'lewis6991/gitsigns.nvim',

	-- Telescope
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-lua/popup.nvim',
			'nvim-tree/nvim-web-devicons',
			'nvim-telescope/telescope-file-browser.nvim',
			{'nvim-telescope/telescope-fzf-native.nvim', build='make'}
		}
	},


	-- Terminal
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {
			open_mapping = [[<leader>tt]],
		}
	},

	-- Paint.nvim is used to create unique color highlights for Markdown headings
	{
		"folke/paint.nvim",
		config = function()
			local hlmap = {
				["^#%s+(.-)%s*$"] = "Operator",
				["^##%s+(.-)%s*$"] = "Type",
				["^###%s+(.-)%s*$"] = "String",
				["^####%s+(.-)%s*$"] = "Constant",
				["^#####%s+(.-)%s*$"] = "Directory",
				["^######%s+(.-)%s*$"] = "Comment",
			}

			local highlights = {}
			for pattern, hl in pairs(hlmap) do
				table.insert(highlights, {
				filter = { filetype = "markdown" },
				pattern = pattern,
				hl = hl,
			  })
			end

			require("paint").setup({
				---@type PaintHighlight[]
				highlights = highlights,
			})
		end,
	},

	-- Markdown editing improvements
	{
		'jakewvincent/mkdnflow.nvim',
		config = function()
			require('mkdnflow').setup({
				-- Make completed symbol a lower-case x
				to_do = {
					symbols = {' ', '-', 'x'},
					update_parents = true,
					not_started = ' ',
					in_progress = '-',
					complete = 'x'
				},
			})
		end
	}
})

-- General config

-- Show a line at 80 columns
-- vim.o.colorcolumn = '80'

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

-- GUI Font
vim.opt.guifont = "JetBrainsMonoNL Nerd Font Mono:h10"

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme retrobox]]) -- requires neovim 0.10.0 or greater


-- Plugin configurations
require('completion')
require('treesitter')
require('nvim-telescope')
require('git')
require('debugger')
