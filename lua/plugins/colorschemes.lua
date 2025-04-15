return {
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd[[colorscheme tokyonight]]
		end
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000 ,
		config = function()
			-- vim.o.background = "dark" -- or "light" for light mode
			-- vim.cmd[[colorscheme gruvbox]]
		end
	},
}
