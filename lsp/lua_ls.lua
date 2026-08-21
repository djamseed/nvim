-- Lua language server.
-- https://github.com/luals/lua-language-server

return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        {
            '.luarc.json',
            '.luarc.jsonc',
            '.luacheckrc',
            '.stylua.toml',
            'stylua.toml',
            'selene.toml',
            'selene.yml',
        },
        '.git',
    },
    settings = {
        Lua = {
            codeLens = { enable = true },
            completion = { callSnippet = 'Replace' },
            diagnostics = {
                disable = { 'missing-fields' },
                globals = { 'vim' },
            },
            hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = 'Disable',
                semicolon = 'Disable',
                arrayIndex = 'Disable',
            },
            runtime = { version = 'LuaJIT' },
            workspace = {
                library = {
                    vim.fs.joinpath(vim.env.VIMRUNTIME, 'lua'),
                    vim.fs.joinpath(vim.fn.stdpath('config'), 'lua'),
                },
                checkThirdParty = false,
            },
        },
    },
}
