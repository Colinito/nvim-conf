return {
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			-- require("gruvbox").setup({
			-- 	terminal_colors = true,
			-- 	undercurl = true,
			-- 	underline = true,
			-- 	bold = false,
			-- 	italic = {
			-- 		strings = false,
			-- 		emphasis = false,
			-- 		comments = false,
			-- 		operators = false,
			-- 		folds = false,
			-- 	},
			-- 	strikethrough = true,
			-- 	invert_selection = false,
			-- 	invert_signs = false,
			-- 	invert_tabline = false,
			-- 	inverse = true, -- invert background for search, diffs, statuslines and errors
			-- 	contrast = "hard", -- can be "hard", "soft" or empty string
			-- 	palette_overrides = {},
			-- 	overrides = {},
			-- 	dim_inactive = false,
			-- 	transparent_mode = false,
			-- })
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
