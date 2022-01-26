local map = vim.api.nvim_set_keymap
local telescope = require('telescope')
local fb_actions = require('telescope').extensions.file_browser.actions

-- This is your opts table
telescope.setup {
  defaults = {
    layout_config = { prompt_position = "top" },
    prompt_prefix = " ",
    sorting_strategy = "ascending",
    dynamic_preview_title = true,
  },
  extensions = {
    file_browser = {
      mappings = {
        ["n"] = {
          ["R"] = fb_actions.rename,
          ["%"] = fb_actions.create,
          ["D"] = fb_actions.remove,
          ["-"] = fb_actions.goto_parent_dir,
          ["_"] = fb_actions.goto_cwd,
          ["B"] = fb_actions.toggle_browser,
          ["<S-h>"] = fb_actions.toggle_hidden,
        },
      },
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {
        -- even more opts
      },
    },
  },
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('ui-select')
telescope.load_extension('file_browser')

map('n', '<leader>h', ':Telescope highlights<cr>', { noremap = true })
map('n', '<leader>k', ':Telescope keymaps<cr>', { noremap = true })
map('n', '<leader>,', ':Telescope vim_options<cr>', { noremap = true })
map('n', '<C-,>', ':Telescope vim_options<cr>', { noremap = true })
map('n', '<C-b>', ':Telescope buffers<cr>', { noremap = true })
map('n', '<C-p>', ':Telescope find_files<cr>', { noremap = true })
map('n', '<C-f>', ':Telescope live_grep<cr>', { noremap = true })
map('n', '<C-q>', ':Telescope quickfix<cr>', { noremap = true })
map('n', '<C-l>', ':Telescope loclist<cr>', { noremap = true })
map('n', '<C-h>', ':Telescope help_tags<cr>', { noremap = true })
map('n', '-', ':Telescope file_browser<cr>', { noremap = true })

