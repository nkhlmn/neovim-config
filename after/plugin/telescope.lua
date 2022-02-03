local telescope = require('telescope')
local fb_actions = require('telescope').extensions.file_browser.actions

-- Configuration
telescope.setup {
  defaults = {
    layout_config = { prompt_position = 'top' },
    sorting_strategy = 'ascending',
    dynamic_preview_title = true,
  },
  extensions = {
    file_browser = {
      mappings = {
        ['n'] = {
          ['R'] = fb_actions.rename,
          ['%'] = fb_actions.create,
          ['D'] = fb_actions.remove,
          ['-'] = fb_actions.goto_parent_dir,
          ['_'] = fb_actions.goto_cwd,
        },
      },
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('ui-select')
telescope.load_extension('file_browser')

-- Mappings for launching pickers
local map = vim.api.nvim_set_keymap
map('n', '<leader>h', ':Telescope highlights<cr>', { noremap = true })
map('n', '<leader>k', ':Telescope keymaps<cr>', { noremap = true })
map('n', '<leader>,', ':Telescope vim_options<cr>', { noremap = true })
map('n', '<C-g>', ':Telescope git_status<cr>', { noremap = true })
map('n', '<C-,>', ':Telescope vim_options<cr>', { noremap = true })
map('n', '<C-b>', ':Telescope buffers<cr>', { noremap = true })
map('n', '<C-p>', ':Telescope find_files<cr>', { noremap = true })
map('n', '<leader>p', ':lua require("telescope.builtin").find_files({ no_ignore = true, hidden = true })<cr>', { noremap = true })
map('n', '<C-f>', ':Telescope live_grep<cr>', { noremap = true })
map('n', '<C-q>', ':Telescope quickfix<cr>', { noremap = true })
map('n', '<C-l>', ':Telescope loclist<cr>', { noremap = true })
map('n', '<C-h>', ':Telescope help_tags<cr>', { noremap = true })
map('n', '-', ':Telescope file_browser<cr>', { noremap = true })
map(
  'n',
  '_',
  ':lua require("telescope").extensions.file_browser.file_browser({ respect_gitignore = false })<cr>',
  { noremap = true }
)
