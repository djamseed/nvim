-- Extension for nvim-dap for launching the python debugger
return {
	"mfussenegger/nvim-dap-python",
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
	ft = "python",
	config = function()
		require("dap-python").setup(vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"))
	end,
}
