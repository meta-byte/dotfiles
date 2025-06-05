local telescope = require('telescope.builtin')
local keymap = vim.keymap.set

local TelescopeKeymaps = {}

function TelescopeKeymaps.setup()
  -- Keymaps for moving selection
  keymap('i', '<C-j>', 'move_selection_next', { desc = 'Move selection next' })
  keymap('i', '<C-k>', 'move_selection_previous', { desc = 'Move selection previous' })

  -- Telescope built-in keymaps
  keymap('n', '<leader>ff', function() telescope.find_files({ hidden = true }) end, { desc = 'Telescope find files (hidden)' })
  keymap('n', '<leader>fg', telescope.git_files, { desc = 'Telescope git files' })
  keymap('n', '<leader>fs', function() telescope.live_grep({ hidden = true }) end, {desc = 'Telescope live grep (hidden)'})
end

return TelescopeKeymaps