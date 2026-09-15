-- Performant, batteries-included completion plugin for Neovim
-- https://github.com/Saghen/blink.cmp

vim.pack.add({
    { src = 'https://github.com/rafamadriz/friendly-snippets' },
    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') },
})

vim.cmd('packadd friendly-snippets')
vim.cmd('packadd blink.cmp')

require('blink.cmp').setup({
    appearance = {
        nerd_font_variant = 'normal',
        use_nvim_cmp_as_default = false,
    },
    completion = {
        accept = {
            auto_brackets = { enabled = true },
        },
        documentation = {
            auto_show = false,
            window = {
                border = 'rounded',
                scrollbar = false,
            },
        },
        ghost_text = { enabled = false },
        list = {
            selection = {
                preselect = true,
                auto_insert = false,
            },
        },
        menu = {
            draw = {
                components = {
                    kind_icon = {
                        text = function(ctx)
                            local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                            return kind_icon
                        end,
                    },
                },
                columns = {
                    { 'kind_icon' },
                    { 'label', 'label_description', gap = 1 },
                    { 'kind' },
                },
            },
            scrollbar = false,
            scrolloff = 1,
        },
    },
    keymap = {
        preset = 'default',
        ['<C-space>'] = {},
        ['<C-a>'] = { 'show', 'show_documentation', 'hide_documentation' },
    },
    cmdline = {
        completion = {
            -- Cmdline mode overrides `completion.menu.auto_show` with its own default, which
            -- only shows the menu in the command-line window, so it has to be set here. Keep
            -- the menu out of the way for `/` and `?`, where it hides the search matches.
            menu = {
                auto_show = function() return not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype()) end,
            },
        },
    },
    signature = {
        enabled = true,
        window = {
            border = 'rounded',
            show_documentation = true,
        },
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})
