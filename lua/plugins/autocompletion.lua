-- Performant, batteries-included completion plugin for Neovim
-- https://github.com/Saghen/blink.cmp

return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	event = 'LspAttach',
	version = '*',
	opts = {
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = 'normal',
		},
		completion = {
			accept = { auto_brackets = { enabled = true } },
			documentation = { window = { border = 'single' } },
			ghost_text = { enabled = false },
			menu = {
				auto_show = function(ctx)
					return ctx.mode ~= 'cmdline' or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
				end,
				draw = {
					columns = {
						{ 'label', 'label_description', gap = 1 },
						{ 'kind_icon', 'kind' },
					},
				},
			},
		},
		keymap = {
			preset = 'default',
			['<C-space>'] = {},
			['<C-a>'] = { 'show', 'show_documentation', 'hide_documentation' },
		},
		signature = { enabled = true },
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
	},
	opts_extend = { 'sources.default' },
}
