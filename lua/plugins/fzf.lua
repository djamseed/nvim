-- A fuzzy finder for Neovim
-- https://github.com/ibhagwan/fzf-lua

return {
	'ibhagwan/fzf-lua',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = 'VimEnter',
	config = function()
		local fzf = require('fzf-lua')
		fzf.setup({
			defaults = {
				prompt = '❯ ',
			},
			keymap = {
				builtin = {
					['<ESC>'] = 'hide',
					['<C-c>'] = 'hide',
				},
			},
			winopts = {
				split = 'belowright new',
			},
		})

		local keymap = require('core.utils').keymap

		keymap('n', '<leader>sf', fzf.files, { desc = 'Find files' })
		keymap('n', '<leader>sg', fzf.git_files, { desc = 'Find git files' })
		keymap('n', '<leader>ss', fzf.live_grep, { desc = 'Find string by grep' })
		keymap('n', '<leader>sw', fzf.grep_cword, { desc = 'Find word' })
		keymap('n', '<leader>sd', fzf.diagnostics_workspace, { desc = 'Find diagnostics' })
		keymap('n', '<leader>sb', fzf.oldfiles, { desc = 'Find recently open files' })
		keymap('n', '<leader>sh', fzf.buffers, { desc = 'Find existing buffers' })
		keymap('n', '<leader>sh', fzf.helptags, { desc = 'Find help' })
		keymap('n', '<leader>s/', fzf.grep_curbuf, { desc = '[/] Fuzzily search in the current buffer' })
	end,
}
