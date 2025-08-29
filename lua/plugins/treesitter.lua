-- Parser and syntax highlighter
-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-context', opts = {} },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
  },
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  main = 'nvim-treesitter.configs', -- sets main module to use for opts
  opts = {
    auto_install = true,
    ensure_installed = {
      'bash',
      'c',
      'c_sharp',
      'css',
      'diff',
      'dockerfile',
      'go',
      'html',
      'javascript',
      'json',
      'lua',
      'markdown',
      'markdown_inline',
      'python',
      'query',
      'rust',
      'textproto',
      'toml',
      'typescript',
      'typst',
      'vim',
      'vimdoc',
      'yaml',
      'zig',
    },
    sync_install = false,
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
  },
}
