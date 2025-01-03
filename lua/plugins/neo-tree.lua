-- Browse the file system and other tree like structures
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  event = 'VeryLazy',
  config = function()
     -- Define diagnostic icons
     vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
     vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
     vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
     vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

     require('neo-tree').setup({
        filesystem = {
           filtered_items = {
              hide_dotfiles = false,
              hide_by_name = {
                 'node_modules',
                 '.virtual_documents',
                 '.python-version',
                 '.venv',
              },
              never_show = {
                 '.DS_Store',
                 '.git',
              },
           },
           follow_current_file = {
              enabled = true,
           },
        },
        window = {
           mappings = {
              ['<space>'] = 'noop',
           },
        },

     })

     local keymap = require('core.utils').keymap

     keymap('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Show file explorer' })

  end
}
