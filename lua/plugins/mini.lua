-- Improve Neovim experience
-- https://github.com/nvim-mini/mini.nvim

return {
    -- extend and create a/i textobjects
    {
        'echasnovski/mini.ai',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            local ai = require('mini.ai')

            ai.setup({
                n_lines = 500,
                custom_textobjects = {
                    -- treesitter-based textobjects for functions, classes, parameters
                    f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
                    c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
                    a = ai.gen_spec.treesitter({ a = '@parameter.outer', i = '@parameter.inner' }),
                },
            })
        end,
    },
    -- icon provider (glyph or ascii)
    { 'echasnovski/mini.icons', version = '*', opts = {}, lazy = true },
    -- add character pairs automatically
    { 'echasnovski/mini.pairs', version = '*', event = { 'InsertEnter' }, opts = {} },
    -- add, delete, replace, find, highlight surrounding (brakets, quotes, etc)
    {
        'echasnovski/mini.surround',
        version = '*',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            mappings = {
                add = 'gza', -- add surrounding
                delete = 'gzd', -- delete surrounding
                find = 'gzf', -- find surrounding (right)
                find_left = 'gzF', -- find surrounding (left)
                highlight = 'gzh', -- highlight surrounding
                replace = 'gzr', -- replace surrounding
                update_n_lines = 'gzn', -- update n_lines
            },
        },
    },
}
