return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {'go', 'javascript', 'lua', 'bash', 'markdown', 'sql', 'python'},
			auto_install = true,
			highlight = { enable = true},
			indent = { enable = true},
		})
	end
}

