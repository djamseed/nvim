-- Lightweight yet powerful formatter
-- https://github.com/stevearc/conform.nvim

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = 'ConformInfo',
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format({ lsp_format = 'fallback', async = true, timeout_ms = 1000 })
      end,
      mode = { 'n', 'v' },
      desc = 'Format buffer',
    },
  },
  opts = {
    default_format_opts = { lsp_format = 'fallback' },
    formatters_by_ft = {
      go = { 'goimports', 'gofumpt' },
      json = { 'prettier' },
      lua = { 'stylua' },
      markdown = { 'prettier' },
      python = { 'ruff' },
      sh = { 'shfmt' },
      sql = { 'sql-formatter' },
      yaml = { 'prettier' },
      zig = { 'zig fmt' },
    },
    format_on_save = {
      async = false,
      timeout_ms = 1000,
    },
    formatters = {
      shfmt = {
        preprend_args = { '-i', '2' },
      },
    },
    notify_on_error = false,
  },
}
