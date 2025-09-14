return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			-- vim.o.background = "dark" -- or "light" for light mode
			-- vim.cmd[[colorscheme gruvbox]]
		end,
	},
}
