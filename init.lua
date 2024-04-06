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

	-- Debugging
	'mfussenegger/nvim-dap',
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		}
	},

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

	-- Telescope
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		dependencies = {'nvim-lua/plenary.nvim'}
	},

	'nvim-telescope/telescope-file-browser.nvim',

	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	},

	-- Comment plugin
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

require('color')
require('completion')
require('treesitter')
require('nvim-telescope')
require('git')
require('keymaps')
require('cfg')

-- Go debugger setup
require('dap.ext.vscode').load_launchjs('launch.json', {})

local dap = require('dap')
dap.adapters.go = {
    type = "server",
    port = '61234',
    executable = {
      command = 'dlv',
      args = {'dap', '-l', '127.0.0.1:61234'},
    },
}

vim.fn.sign_define('DapBreakpoint', {text = '🅱️', texthl = '', linehl = '', numhl = ''})
