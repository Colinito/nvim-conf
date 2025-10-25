return {
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			vim.cmd[[colorscheme gruvbox]]
		end
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none"
							}
						}
					}
				}
			})
		end,
	},
}
