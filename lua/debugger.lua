require('dap.ext.vscode').load_launchjs('launch.json', {})

local dap = require('dap')

dap.adapters.go = {
	type = "server",
	port = '${port}', -- Select a random port automatically
	executable = {
		command = 'dlv',
		args = {'dap', '-l', '127.0.0.1:${port}'},
	},
}

vim.fn.sign_define('DapBreakpoint', {text = '🅱️', texthl = '', linehl = '', numhl = ''})

local dapui = require('dapui')
dapui.setup()

vim.keymap.set('n', '<leader>dc', dap.continue, {})
vim.keymap.set('n', '<leader>dn', dap.step_over, {})
vim.keymap.set('n', '<leader>ds', dap.step_into, {})
vim.keymap.set('n', '<leader>do', dap.step_out, {})
vim.keymap.set('n', '<leader>dt', dap.terminate, {})
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<leader>du', dapui.toggle, {})
