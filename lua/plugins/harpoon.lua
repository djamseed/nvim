-- Mark and navigate to files
-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2

return {
   'ThePrimeagen/harpoon',
   branch = 'harpoon2',
   event = 'VeryLazy',
   config = function()
      local harpoon = require('harpoon')
      local keymap = require('core.utils').keymap

      harpoon:setup()

      keymap('n', '<leader>hm', function() harpoon:list():append() end, { desc = 'Mark file with harpoon' })
      keymap('n', '<leader>hq', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Open the harpoon quick menu' })
      keymap('n', '<leader>hp', function() harpoon:list():prev() end, { desc = 'Go to the previous marked buffer' })
      keymap('n', '<leader>hn', function() harpoon:list():next() end, { desc = 'Go to the next marked buffer' })

      -- Switch to any marked buffer (from 1 - 9)
      for i = 1, 9 do
         keymap('n', string.format('<leader>h%s', i), function()
            harpoon:list():select(i)
         end, { desc = string.format('Switch to marked buffer %s', i) })
      end
   end,
}
