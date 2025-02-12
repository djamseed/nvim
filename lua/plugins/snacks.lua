-- A collection of small QoL plugins for Neovim
-- https://github.com/folke/snacks.nvim

return {
	'folke/snacks.nvim',
	opts = {
		animate = { enabled = false },
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ section = 'header' },
				{ section = 'keys', gap = 1, padding = 1 },
				{ section = 'startup' },
			},
		},
		image = { enabled = true, force = true },
		indent = {
			enabled = true,
			char = '.',
			only_current = true,
		},
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		quickfile = {},
		words = { enabled = true },
	},
}
