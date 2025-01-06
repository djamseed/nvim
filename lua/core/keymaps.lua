local keymap = require('core.utils').keymap

-- Disable the spacebar key's default behavior in Normal and Visual modes
keymap('<space>', '<Nop>', { silent = true }, { 'n', 'v' })

-- Disable the Q key's default behavior in Normal mode
keymap('Q', '<Nop>', { silent = true })

-- Better cusror movement
keymap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = 'Move cusror up' }, { 'n', 'x' })
keymap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = 'Move cusror down' }, { 'n', 'x' })
keymap('<C-u>', '<C-u>zz', { desc = 'Move cursor and screen up' })
keymap('<C-d>', '<C-d>zz', { desc = 'Move cursor and screen down' })

-- Pane navigation
keymap('<C-h>', '<C-w>h', { desc = 'Navigate to left window' })
keymap('<C-j>', '<C-w>j', { desc = 'Navigate to window below' })
keymap('<C-k>', '<C-w>k', { desc = 'Navigate to window above' })
keymap('<C-l>', '<C-w>l', { desc = 'Navigate to right window' })

-- Quickfix navigation
keymap('<C-k>', '<CMD>cnext<CR>zz', { desc = 'Jump to next match' })
keymap('<C-j>', '<CMD>cprev<CR>zz', { desc = 'Jump to previous match' })

-- Window management (split)
keymap('<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
keymap('<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap('<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
keymap('<leader>sx', '<CMD>close<CR>', { desc = 'Close current split' })

-- Use Ctrl + c to exit Insert mode (useful for Visual block mode)
keymap('<C-c>', '<ESC>', { desc = 'Exit INSERT mode' }, 'i')

-- Use Ctrl + s to save buffer
keymap('<C-s>', '<CMD>w<CR><ESC>', { desc = 'Save the current buffer' }, { 'i', 'n', 's', 'x' })

-- Use Ctrl + q to quit file
keymap('<C-q>', '<CMD> q<CR>', { desc = 'Quit the current buffer' })

-- Use Ctrl + Alt + j/k to move lines up/down
keymap('<C-A-k>', '<ESC><CMD>m .-2<CR>==gi', { desc = 'Move line(s) up' }, 'i')
keymap('<C-A-j>', '<ESC><CMD>m .+1<CR>==gi', { desc = 'Move lines(s) down' }, 'i')
keymap('<C-A-k>', '<CMD>m .-2<CR>==', { desc = 'Move line(s) up' })
keymap('<C-A-j>', '<CMD>m .+1<CR>==', { desc = 'Move line(s) down' })
keymap('<C-A-k>', "<CMD>m '<-2<CR>gv=gv", { desc = 'Move line(s) up' }, 'v')
keymap('<C-A-j>', "<CMD>m '>+1<CR>gv=gv", { desc = 'Move line(s) down' }, 'v')

-- Identing
keymap('>', '>>', { desc = 'Shift text to the right' })
keymap('<', '<<', { desc = 'Shift text to the left' })
keymap('>', '>gv', { desc = 'Shift text to the right' }, 'v')
keymap('<', '<gv', { desc = 'Shift text to the left' }, 'v')

-- Toggle line wrapping
keymap('<leader>lw', '<CMD>set wrap!<CR>', { desc = 'Toggle line wrapping' })

-- Join line below to the current one and keep with one
-- space in-between the cursor at the beginning of the line
keymap('J', 'mzJ`z', { desc = 'Join line below to the current one' })

-- Keep the cursor at the same position when searching word under it
keymap('n', 'nzzzv', { desc = 'Repeat search in the same direction' })
keymap('N', 'Nzzzv', { desc = 'Repeat search in the same direction (backward)' })

-- Paste over highlighted text and delete the same from the void register
keymap('<leader>v', '"_dP', { desc = 'Keep the last yanked when pasting' }, 'x')

-- Copy text to system clipboard
keymap('<leader>y', [["+y]], { desc = 'Yank into the system clipboard register' }, { 'n', 'v' })
keymap('<leader>Y', [["+Y]], { desc = 'Yank into the system clipboard register' })
