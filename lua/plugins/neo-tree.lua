return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						require("neo-tree").close_all()
					end,
				},
			},
		})

		vim.keymap.set("n", "<C-e>", ":Neotree filesystem reveal left <CR>", {})
	end,
}
