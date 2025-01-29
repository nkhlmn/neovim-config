return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-lua/plenary.nvim' }
    },
    config = function ()
      local telescope = require('telescope')

      -- Configuration
      telescope.setup({
        defaults = {
          layout_config = { prompt_position = 'top' },
          sorting_strategy = 'ascending',
          mappings = {
            n = {
              ['X'] = 'delete_buffer'
            },
          }
        },
      })

      telescope.load_extension('fzf')
      telescope.load_extension('gore')
    end
  },
}
