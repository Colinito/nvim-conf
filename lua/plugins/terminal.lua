return {
	'akinsho/toggleterm.nvim',
	version = "*",
	opts = {
		open_mapping = [[<leader>tt]],
	},
	config = function()
		local terminal = require('toggleterm')
		terminal.setup()
	end
}
