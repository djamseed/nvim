-- Lightweight yet powerful formatter
-- https://github.com/stevearc/conform.nvim

return {
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	cmd = 'ConformInfo',
	keys = {
		{
			'<leader>cf',
			function()
				require('conform').format({ lsp_format = 'fallback', async = true, timeout_ms = 1000 })
			end,
			mode = { 'n', 'v' },
			desc = 'Format',
		},
	},
	config = function()
		require('conform').setup({
			formatters_by_ft = {
				go = { 'goimports', 'gofumpt' },
				json = { 'prettier' },
				lua = { 'stylua' },
				markdown = { 'prettier' },
				python = { 'ruff' },
				rust = { 'rustfmt' },
				sh = { 'shfmt' },
				sql = { 'sql-formatter' },
				yaml = { 'prettier' },
				zig = { 'zig fmt' },
			},
			format_on_save = {
				lsp_format = 'fallback',
				async = false,
				timeout_ms = 1000,
			},
			notify_on_error = false,
		})
	end,
}
