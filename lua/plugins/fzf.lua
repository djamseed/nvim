-- A fuzzy finder for Neovim
-- https://github.com/ibhagwan/fzf-lua

return {
	'ibhagwan/fzf-lua',
	event = 'VimEnter',
	cmd = 'FzfLua',
	keys = {
		{ '<leader>f/', '<CMD>FzfLua grep_curbuf<CR>', desc = '[/] Fuzzily search in the current buffer', noremap = true, silent = true },
		{ '<leader>fb', '<CMD>FzfLua buffers<CR>', desc = 'Find open buffers', noremap = true, silent = true },
		{ '<leader>fd', '<CMD>FzfLua diagnostics_workspace<CR>', desc = 'Find diagnostics in workspace', noremap = true, silent = true },
		{ '<leader>ff', '<CMD>FzfLua files<CR>', desc = 'Find files', noremap = true, silent = true },
		{ '<leader>fg', '<CMD>FzfLua git_files<CR>', desc = 'Find git files', noremap = true, silent = true },
		{ '<leader>fh', '<CMD>FzfLua helptags<CR>', desc = 'Find in help', noremap = true, silent = true },
		{ '<leader>fr', '<CMD>FzfLua oldfiles<CR>', desc = 'Find recently opened files', noremap = true, silent = true },
		{ '<leader>fs', '<CMD>FzfLua live_grep_native<CR>', desc = 'Find by Grep', noremap = true, silent = true },
		{ '<leader>fw', '<CMD>FzfLua grep_cword<CR>', desc = 'Find current word', noremap = true, silent = true },
		{ '<leader>fW', '<CMD>FzfLua grep_cWORD<CR>', desc = 'Find current word', noremap = true, silent = true },
	},
	config = function()
		require('fzf-lua').setup({
			{ 'ivy' }, -- Use Telescope's ivy profile
			defaults = {
				prompt = '❯ ',
			},
			grep = {
				rg_opts = '--column --line-number --no-heading --color=always --smart-case --hidden --max-columns=4096 -e',
			},
			keymap = {
				builtin = {
					['<ESC>'] = 'hide',
					['<C-c>'] = 'hide',
				},
			},
			winopts = {
				preview = {
					default = 'bat_native',
					title = true,
				},
			},
		})
	end,
}
