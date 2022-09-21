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
telescope.load_extension('fzf')

-- Mappings for launching pickers
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<leader>h', ':Telescope highlights<cr>', opts)
map('n', '<leader>k', ':Telescope keymaps<cr>', opts)
map('n', '<leader>,', ':Telescope vim_options<cr>', opts)
map('n', '<C-t><C-t>', ':Telescope<cr>', opts)
map('n', '<C-t>c', ':Telescope colorscheme<cr>', opts)
map('n', '<C-g>', ':Telescope git_status<cr>', opts)
map('n', '<C-,>', ':Telescope vim_options<cr>', opts)
map('n', '<C-b>', ':Telescope buffers<cr>', opts)
map('n', '<C-p>', ':Telescope find_files<cr>', opts)
map('n', '<leader>p', ':lua require("telescope.builtin").find_files({no_ignore=true,hidden=true})<cr>', opts)
map('n', '<C-f>', ':Telescope live_grep<cr>', opts)
map('n', '<C-q>', ':Telescope quickfix<cr>', opts)
map('n', '<C-l>', ':Telescope loclist<cr>', opts)
map('n', '<C-h>', ':Telescope help_tags<cr>', opts)
map('n', '-', ':Telescope file_browser<cr>', opts)
map('n', '_', ':lua require("telescope").extensions.file_browser.file_browser({respect_gitignore=false})<cr>', opts)
