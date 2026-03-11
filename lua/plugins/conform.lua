return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				vue = {"biome", "prettier"},
				css = { "biome" },
				html = { "biome" },
				json = { "biome" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
			},
		})
		vim.keymap.set({ "n", "v" }, "<space>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format files using conform" })
		vim.o.formatexpr = "v:lua.require'conform'.format_expr()"
	end,
}
