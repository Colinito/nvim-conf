-- Toggle background between dark and light
vim.keymap.set("n", "<leader>tb", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, { noremap = true, silent = true, desc = "Toggle background" })
