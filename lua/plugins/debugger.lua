return {
	'mfussenegger/nvim-dap',
	dependencies = {
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		}
	},

	config = function()
		local dap = require('dap')

		dap.adapters.go = {
			type = "server",
			port = '${port}', -- Select a random port automatically
			executable = {
				command = 'dlv',
				args = {'dap', '-l', '127.0.0.1:${port}'},
			},
		}

		dap.configurations.go = {
			{
				type = "go",
				name = "Debug",
				request = "launch",
				program = "${file}",
			},
			{
				type = "go",
				name = "Debug Package",
				request = "launch",
				program = "${fileDirname}",
			},
			{
				type = "go",
				name = "Debug test",
				request = "launch",
				mode = "test",
				program = "${file}",
			},
			{
				type = "go",
				name = "Debug test (go.mod)",
				request = "launch",
				mode = "test",
				program = "./${relativeFileDirname}",
			},
		}

		require('dap.ext.vscode').load_launchjs('./launch.json', {})

		vim.fn.sign_define('DapBreakpoint', {
			text = '🅱️',
			texthl = '',
			linehl = '',
			numhl = ''
		})

		local dapui = require('dapui')
		dapui.setup()

		vim.keymap.set('n', '<leader>dc', dap.continue, {})
		vim.keymap.set('n', '<leader>dn', dap.step_over, {})
		vim.keymap.set('n', '<leader>ds', dap.step_into, {})
		vim.keymap.set('n', '<leader>do', dap.step_out, {})
		vim.keymap.set('n', '<leader>dt', dap.terminate, {})
		vim.keymap.set('n', '<leader>dr', dap.restart, {})
		vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
		vim.keymap.set('n', '<leader>du', dapui.toggle, {})
	end
}
