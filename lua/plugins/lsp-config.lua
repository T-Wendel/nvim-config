return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {"lua_ls", "jsonls", "tsserver", "taplo", "yamlls", "html", "gopls"}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({capabilities = capabilities})
			lspconfig.gopls.setup({capabilities = capabilities})
			lspconfig.jsonls.setup({capabilities = capabilities})
			lspconfig.tsserver.setup({capabilities = capabilities})
			lspconfig.taplo.setup({capabilities = capabilities})
			lspconfig.yamlls.setup({capabilities = capabilities})
			lspconfig.html.setup({capabilities = capabilities})
			lspconfig.sqls.setup({capabilities = capabilities})

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
		end,
	},
}


