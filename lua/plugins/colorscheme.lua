-- Dark theme inspired by IBM carbon
-- https://github.com/nyoom-engineering/oxocarbon.nvim

vim.pack.add({ 'https://github.com/nyoom-engineering/oxocarbon.nvim' })

vim.cmd.colorscheme('oxocarbon')

-- Oxocarbon defines `BlinkCmpMenuSelection` as an empty group, and blink.cmp only
-- links its own highlights with `default = true`, so its link to `PmenuSel` is
-- skipped. The selected item then renders like every other one and the completion
-- menu looks frozen when moving through it with <C-n> / <C-p>.
vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { link = 'PmenuSel' })
