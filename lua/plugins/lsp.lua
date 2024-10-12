return {
	'neovim/nvim-lspconfig',

	config = function()
		-- Set up lspconfig
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		-- Use a loop to conveniently call 'setup' on multiple servers and
		-- map buffer local keybindings when the language server attaches
		local servers = {
			'pyright',
			'clangd',
			'gopls',
			'denols',
			'gdscript',
			'ts_ls',
			'html',
			'marksman'
		}
		for _, lsp in ipairs(servers) do
			require('lspconfig')[lsp].setup {
				capabilities = capabilities,
				on_attach = on_attach,
				flags = {
					debounce_text_changes = 150,
				}
			}
		end

		-- NOTE: Install @vue/language-server and @vue/typescript-plugin to make this work
		-- TODO: Make this work for MacOS
		require'lspconfig'.volar.setup{
			filetypes = {
				'typescript',
				'javascript',
				'javascriptreact',
				'typescriptreact',
				'vue',
				'json'
			},
			init_options = {
				typescript = {
					tsdk = '/usr/local/bin/vue-language-server'
				}
			}
		}

		-- CSS LSP
		capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		require'lspconfig'.cssls.setup {
			capabilities = capabilities,
		}

		local opts = { noremap=true, silent=true }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
	end
}
