-- Dark theme inspired by IBM carbon
-- https://github.com/nyoom-engineering/oxocarbon.nvim

vim.pack.add({ 'https://github.com/nyoom-engineering/oxocarbon.nvim' })

vim.cmd.colorscheme('oxocarbon')

vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { link = 'PmenuSel' })
