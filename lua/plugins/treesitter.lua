return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true
			},
			indent = {
				enable = true
			},
			autotag = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					-- set to `false` to disable one of the mappings
					init_selection = "<C-space>",
					node_incremental = "<C-space",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"css",
				"scss",
				"html",
				"vue",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"go",
				"gomod",
				"c",
				"cpp",
				"sql",
				"sql",
				"cmake",
				"make",
				"yaml",
				"python",
				"comment",
			},
		})
	end
}
