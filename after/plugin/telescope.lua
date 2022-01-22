local map = vim.api.nvim_set_keymap
local telescope = require('telescope')

-- This is your opts table
telescope.setup {
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {
        -- even more opts
      }
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('ui-select')

map('n', '<leader>h', ':Telescope highlights<cr>', { noremap = true })
map('n', '<leader>k', ':Telescope keymaps<cr>', { noremap = true })
-- map('n', '<leader>,', ':Telescope vim_options<cr>', { noremap = true })
map('n', '<C-,>', ':Telescope vim_options<cr>', { noremap = true })
map('n', '<C-b>', ':Telescope buffers<cr>', { noremap = true })
-- map('n', '<C-b>', ':Telescope file_browser<cr>', { noremap = true })
map('n', '<C-p>', ':Telescope find_files<cr>', { noremap = true })
map('n', '<C-f>', ':Telescope live_grep<cr>', { noremap = true })
map('n', '<C-q>', ':Telescope quickfix<cr>', { noremap = true })
map('n', '<C-l>', ':Telescope loclist<cr>', { noremap = true })
map('n', '<C-h>', ':Telescope help_tags<cr>', { noremap = true })

