return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-lua/plenary.nvim' }
    },
    config = function ()
      local telescope = require('telescope')
      local fb_actions = require('telescope').extensions.file_browser.actions

      -- Configuration
      telescope.setup({
        defaults = {
          layout_config = { prompt_position = 'top' },
          sorting_strategy = 'ascending',
          dynamic_preview_title = true,
        },
        extensions = {
          file_browser = {
            theme = 'ivy',
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
        },
      })

      telescope.load_extension('file_browser')
      telescope.load_extension('fzf')
      telescope.load_extension('contemplate')
      telescope.load_extension('gore')
    end
  },
}
