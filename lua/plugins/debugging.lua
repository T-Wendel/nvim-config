return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local ducksauce = require("dap") -- strange name for future ref to se how variables can be used
		local dapui = require("dapui")

		require("dap-go").setup()
		require("dapui").setup()

		ducksauce.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		ducksauce.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		ducksauce.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		ducksauce.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>b", function()
			ducksauce.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>B", function()
			ducksauce.set_breakpoint()
		end)
		vim.keymap.set("n", "<F5>", function()
			ducksauce.continue()
		end)
		vim.keymap.set("n", "<F10>", function()
			ducksauce.step_over()
		end)
		vim.keymap.set("n", "<F11>", function()
			ducksauce.step_into()
		end)
		vim.keymap.set("n", "<F12>", function()
			ducksauce.step_out()
		end)
	end,
}
