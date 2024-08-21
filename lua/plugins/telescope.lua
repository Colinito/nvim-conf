return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.4',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-lua/popup.nvim',
		'nvim-tree/nvim-web-devicons',
		'nvim-telescope/telescope-file-browser.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build='make'
		}
	},

	config = function()
		local telescope = require('telescope')
		telescope.setup({})
		telescope.load_extension('file_browser')
		telescope.load_extension('fzf')

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		vim.keymap.set('n', '<leader>fl', builtin.lsp_references, {})
		vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
		vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
		vim.keymap.set('n', '<leader>fc', builtin.git_commits, {})
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
		vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
		vim.keymap.set('n', '<space>fb', ':Telescope file_browser<CR>', { noremap = true })
		vim.keymap.set('n', '<space>fc', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true })
	end
}
