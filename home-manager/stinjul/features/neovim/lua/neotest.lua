local neotest = require("neotest")
local elixir = require("neotest-elixir")

neotest.setup({
	adapters = {
		elixir({
			cwd = elixir.root(vim.fn.getcwd())
		}),
		require("neotest-python")
	},
})
