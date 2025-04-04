-- Git integration for buffers
-- https://github.com/lewis6991/gitsigns.nvim

return {
	'lewis6991/gitsigns.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local gs = require('gitsigns')
		local keymap = require('core.utils').keymap

		gs.setup({
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				keymap('<leader>gb', function() gs.blame_line({ full = false }) end, { buffer = bufnr, desc = 'Git blame line' })
				keymap('<leader>gh', gs.preview_hunk, { buffer = bufnr, desc = 'Git preview hunk' })
				keymap('<leader>gs', gs.stage_hunk, { buffer = bufnr, desc = 'Git stage hunk' })
				keymap('<leader>gr', gs.reset_hunk, { buffer = bufnr, desc = 'Git reset hunk' })
				keymap('<leader>gu', gs.undo_stage_hunk, { buffer = bufnr, desc = 'Git undo stage hunk' })
			end,
		})
	end,
}
