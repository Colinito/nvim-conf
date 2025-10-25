-- Get capabilities from nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure CSS capabilities with snippet support
local css_capabilities = vim.lsp.protocol.make_client_capabilities()
css_capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Define server configurations using the new vim.lsp.config API
local servers = {
	pyright = {
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
	},
	clangd = {
		cmd = { "clangd" },
		filetypes = { "c", "cpp", "objc", "objcpp" },
		root_markers = { "compile_commands.json", ".git" },
	},
	gopls = {
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_markers = { "go.mod", ".git" },
	},
	gdscript = {
		cmd = { "nc", "localhost", "6005" },
		filetypes = { "gd", "gdscript", "gdscript3" },
		root_markers = { "project.godot", ".git" },
	},
	ts_ls = {
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
	},
	html = {
		cmd = { "vscode-html-language-server", "--stdio" },
		filetypes = { "html" },
		root_markers = { "package.json", ".git" },
	},
	marksman = {
		cmd = { "marksman", "server" },
		filetypes = { "markdown" },
		root_markers = { ".marksman.toml", ".git" },
	},
	lua_ls = {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", ".git" },
	},
	cssls = {
		cmd = { "vscode-css-language-server", "--stdio" },
		filetypes = { "css", "scss", "less" },
		root_markers = { "package.json", ".git" },
	},
}

-- Set up each server with the new API
for server_name, server_config in pairs(servers) do
	-- Use CSS capabilities for cssls, otherwise use default
	local caps = server_name == "cssls" and css_capabilities or capabilities

	-- Merge capabilities into the server config
	server_config.capabilities = caps

	-- Set debounce flag
	if not server_config.flags then
		server_config.flags = {}
	end
	server_config.flags.debounce_text_changes = 150

	-- Configure the server
	vim.lsp.config[server_name] = server_config
end

-- Enable LSP servers on appropriate filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		-- Map filetypes to LSP servers
		local filetype_to_server = {
			python = "pyright",
			c = "clangd",
			cpp = "clangd",
			objc = "clangd",
			objcpp = "clangd",
			go = "gopls",
			gomod = "gopls",
			gowork = "gopls",
			gotmpl = "gopls",
			gd = "gdscript",
			gdscript = "gdscript",
			gdscript3 = "gdscript",
			javascript = "ts_ls",
			javascriptreact = "ts_ls",
			typescript = "ts_ls",
			typescriptreact = "ts_ls",
			html = "html",
			markdown = "marksman",
			lua = "lua_ls",
			css = "cssls",
			scss = "cssls",
			less = "cssls",
		}

		local server = filetype_to_server[args.match]
		if server then
			vim.lsp.enable(server)
		end
	end,
})

-- Set up keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set("n", "<space>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
-- NOTE This has been replaced by conform.nvim
-- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
